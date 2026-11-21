/* =====================================================================
   STORE PROCEDURE CHO TRANG QUẢN TRỊ PHÂN QUYỀN + NGƯỜI DÙNG
   Chạy SAU file phan_quyen_seed.sql
   ===================================================================== */
USE DataNhaHang;
GO

/* ---------- NHÓM QUYỀN ---------- */
IF OBJECT_ID('dbo.pro_role_list') IS NOT NULL DROP PROCEDURE dbo.pro_role_list;
GO
CREATE PROCEDURE dbo.pro_role_list
AS
BEGIN
    SET NOCOUNT ON;
    SELECT r.ROLE_ID, r.ROLE_CODE, r.ROLE_NAME, r.IS_ACTIVE,
           (SELECT COUNT(*) FROM dbo.TBL_USER_ROLE ur WHERE ur.ROLE_ID = r.ROLE_ID)       AS SO_USER,
           (SELECT COUNT(*) FROM dbo.TBL_ROLE_PERMISSION rp WHERE rp.ROLE_ID = r.ROLE_ID) AS SO_QUYEN
    FROM dbo.TBL_ROLE r
    ORDER BY CASE r.ROLE_CODE WHEN 'ADMIN' THEN 0 ELSE 1 END, r.ROLE_ID;
END
GO

IF OBJECT_ID('dbo.pro_role_save') IS NOT NULL DROP PROCEDURE dbo.pro_role_save;
GO
CREATE PROCEDURE dbo.pro_role_save
    @ROLE_ID   INT,            -- 0 = thêm mới
    @ROLE_CODE VARCHAR(50),
    @ROLE_NAME NVARCHAR(100),
    @IS_ACTIVE INT
AS
BEGIN
    SET NOCOUNT ON;

    IF @ROLE_ID = 0
    BEGIN
        IF EXISTS (SELECT 1 FROM dbo.TBL_ROLE WHERE ROLE_CODE = @ROLE_CODE)
        BEGIN
            SELECT 'DUP' AS RESULT, 0 AS ROLE_ID; RETURN;
        END
        INSERT dbo.TBL_ROLE (ROLE_CODE, ROLE_NAME, IS_ACTIVE)
        VALUES (@ROLE_CODE, @ROLE_NAME, CASE WHEN @IS_ACTIVE = 1 THEN 1 ELSE 0 END);
        SET @ROLE_ID = SCOPE_IDENTITY();
    END
    ELSE
    BEGIN
        -- Không cho ngừng hoạt động nhóm ADMIN (mã nhóm không cho sửa)
        IF @IS_ACTIVE = 0 AND EXISTS (SELECT 1 FROM dbo.TBL_ROLE WHERE ROLE_ID = @ROLE_ID AND ROLE_CODE = 'ADMIN')
        BEGIN
            SELECT 'ADMIN' AS RESULT, @ROLE_ID AS ROLE_ID; RETURN;
        END
        UPDATE dbo.TBL_ROLE
        SET ROLE_NAME = @ROLE_NAME,
            IS_ACTIVE = CASE WHEN @IS_ACTIVE = 1 THEN 1 ELSE 0 END
        WHERE ROLE_ID = @ROLE_ID;
    END

    SELECT 'OK' AS RESULT, @ROLE_ID AS ROLE_ID;
END
GO

IF OBJECT_ID('dbo.pro_role_delete') IS NOT NULL DROP PROCEDURE dbo.pro_role_delete;
GO
CREATE PROCEDURE dbo.pro_role_delete
    @ROLE_ID INT
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    IF EXISTS (SELECT 1 FROM dbo.TBL_ROLE WHERE ROLE_ID = @ROLE_ID AND ROLE_CODE = 'ADMIN')
    BEGIN SELECT 'ADMIN' AS RESULT; RETURN; END

    IF EXISTS (SELECT 1 FROM dbo.TBL_USER_ROLE WHERE ROLE_ID = @ROLE_ID)
    BEGIN SELECT 'HASUSER' AS RESULT; RETURN; END

    BEGIN TRAN;
        DELETE dbo.TBL_ROLE_PERMISSION WHERE ROLE_ID = @ROLE_ID;
        DELETE dbo.TBL_ROLE WHERE ROLE_ID = @ROLE_ID;
    COMMIT;

    SELECT 'OK' AS RESULT;
END
GO

/* Lưới quyền của 1 nhóm: mỗi dòng 1 module, mỗi hành động 2 cột:
   P_xxx = PERM_ID (NULL nếu module không có hành động đó)
   C_xxx = 1 nếu nhóm đang có quyền */
IF OBJECT_ID('dbo.pro_role_get_matrix') IS NOT NULL DROP PROCEDURE dbo.pro_role_get_matrix;
GO
CREATE PROCEDURE dbo.pro_role_get_matrix
    @ROLE_ID INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT m.MODULE_ID, m.MODULE_CODE, m.MODULE_NAME,
           CASE WHEN gp.MODULE_ID IS NOT NULL THEN gp.MODULE_NAME + N' › ' + p.MODULE_NAME
                WHEN p.MODULE_ID  IS NOT NULL THEN p.MODULE_NAME
                ELSE N'TRANG CHÍNH' END AS GROUP_NAME,

           MAX(CASE WHEN pm.ACTION_CODE = 'VIEW'    THEN pm.PERM_ID END) AS P_VIEW,
           MAX(CASE WHEN pm.ACTION_CODE = 'ADD'     THEN pm.PERM_ID END) AS P_ADD,
           MAX(CASE WHEN pm.ACTION_CODE = 'EDIT'    THEN pm.PERM_ID END) AS P_EDIT,
           MAX(CASE WHEN pm.ACTION_CODE = 'DELETE'  THEN pm.PERM_ID END) AS P_DELETE,
           MAX(CASE WHEN pm.ACTION_CODE = 'PRINT'   THEN pm.PERM_ID END) AS P_PRINT,
           MAX(CASE WHEN pm.ACTION_CODE = 'EXPORT'  THEN pm.PERM_ID END) AS P_EXPORT,
           MAX(CASE WHEN pm.ACTION_CODE = 'APPROVE' THEN pm.PERM_ID END) AS P_APPROVE,

           MAX(CASE WHEN pm.ACTION_CODE = 'VIEW'    AND rp.PERM_ID IS NOT NULL THEN 1 ELSE 0 END) AS C_VIEW,
           MAX(CASE WHEN pm.ACTION_CODE = 'ADD'     AND rp.PERM_ID IS NOT NULL THEN 1 ELSE 0 END) AS C_ADD,
           MAX(CASE WHEN pm.ACTION_CODE = 'EDIT'    AND rp.PERM_ID IS NOT NULL THEN 1 ELSE 0 END) AS C_EDIT,
           MAX(CASE WHEN pm.ACTION_CODE = 'DELETE'  AND rp.PERM_ID IS NOT NULL THEN 1 ELSE 0 END) AS C_DELETE,
           MAX(CASE WHEN pm.ACTION_CODE = 'PRINT'   AND rp.PERM_ID IS NOT NULL THEN 1 ELSE 0 END) AS C_PRINT,
           MAX(CASE WHEN pm.ACTION_CODE = 'EXPORT'  AND rp.PERM_ID IS NOT NULL THEN 1 ELSE 0 END) AS C_EXPORT,
           MAX(CASE WHEN pm.ACTION_CODE = 'APPROVE' AND rp.PERM_ID IS NOT NULL THEN 1 ELSE 0 END) AS C_APPROVE
    FROM dbo.TBL_MODULE m
    JOIN dbo.TBL_PERMISSION pm            ON pm.MODULE_ID = m.MODULE_ID
    LEFT JOIN dbo.TBL_ROLE_PERMISSION rp  ON rp.PERM_ID = pm.PERM_ID AND rp.ROLE_ID = @ROLE_ID
    LEFT JOIN dbo.TBL_MODULE p            ON p.MODULE_ID = m.PARENT_ID
    LEFT JOIN dbo.TBL_MODULE gp           ON gp.MODULE_ID = p.PARENT_ID
    GROUP BY m.MODULE_ID, m.MODULE_CODE, m.MODULE_NAME, m.SORT_ORDER,
             p.MODULE_ID, p.MODULE_NAME, p.SORT_ORDER,
             gp.MODULE_ID, gp.MODULE_NAME, gp.SORT_ORDER
    ORDER BY COALESCE(gp.SORT_ORDER, p.SORT_ORDER, m.SORT_ORDER),
             CASE WHEN gp.MODULE_ID IS NOT NULL THEN p.SORT_ORDER * 100 + m.SORT_ORDER
                  WHEN p.MODULE_ID  IS NOT NULL THEN m.SORT_ORDER * 100
                  ELSE 0 END;
END
GO

/* Lưu quyền của nhóm: @PERM_IDS = '1,2,5,9' (toàn bộ quyền được tick) */
IF OBJECT_ID('dbo.pro_role_save_permissions') IS NOT NULL DROP PROCEDURE dbo.pro_role_save_permissions;
GO
CREATE PROCEDURE dbo.pro_role_save_permissions
    @ROLE_ID  INT,
    @PERM_IDS VARCHAR(MAX)
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    DECLARE @ids TABLE (PERM_ID INT PRIMARY KEY);

    IF LEN(ISNULL(@PERM_IDS, '')) > 0
    BEGIN
        DECLARE @x XML = CAST('<i>' + REPLACE(@PERM_IDS, ',', '</i><i>') + '</i>' AS XML);
        INSERT @ids (PERM_ID)
        SELECT DISTINCT t.i.value('.', 'INT')
        FROM @x.nodes('/i') t(i);
    END

    -- Nhóm ADMIN luôn giữ quyền vào trang phân quyền (tránh tự khóa mình)
    IF EXISTS (SELECT 1 FROM dbo.TBL_ROLE WHERE ROLE_ID = @ROLE_ID AND ROLE_CODE = 'ADMIN')
        INSERT @ids (PERM_ID)
        SELECT p.PERM_ID FROM dbo.TBL_PERMISSION p
        WHERE p.PERM_CODE IN ('SYS_PHANQUYEN.VIEW', 'SYS_PHANQUYEN.EDIT',
                              'SYS_NGUOIDUNG.VIEW', 'SYS_NGUOIDUNG.EDIT')
          AND NOT EXISTS (SELECT 1 FROM @ids i WHERE i.PERM_ID = p.PERM_ID);

    BEGIN TRAN;
        DELETE rp FROM dbo.TBL_ROLE_PERMISSION rp
        WHERE rp.ROLE_ID = @ROLE_ID
          AND NOT EXISTS (SELECT 1 FROM @ids i WHERE i.PERM_ID = rp.PERM_ID);

        INSERT dbo.TBL_ROLE_PERMISSION (ROLE_ID, PERM_ID)
        SELECT @ROLE_ID, i.PERM_ID
        FROM @ids i
        JOIN dbo.TBL_PERMISSION p ON p.PERM_ID = i.PERM_ID
        WHERE NOT EXISTS (SELECT 1 FROM dbo.TBL_ROLE_PERMISSION rp
                          WHERE rp.ROLE_ID = @ROLE_ID AND rp.PERM_ID = i.PERM_ID);
    COMMIT;

    SELECT 'OK' AS RESULT;
END
GO

/* ---------- NGƯỜI DÙNG ---------- */
IF OBJECT_ID('dbo.pro_user_list') IS NOT NULL DROP PROCEDURE dbo.pro_user_list;
GO
CREATE PROCEDURE dbo.pro_user_list
AS
BEGIN
    SET NOCOUNT ON;
    SELECT u.U_ID, u.U_NAME, u.U_FULLNAME, u.U_EMAIL, u.U_ACTIVE, u.INSERT_DATE,
           ISNULL(STUFF((SELECT N', ' + r.ROLE_NAME
                         FROM dbo.TBL_USER_ROLE ur
                         JOIN dbo.TBL_ROLE r ON r.ROLE_ID = ur.ROLE_ID
                         WHERE ur.U_ID = u.U_ID
                         ORDER BY r.ROLE_ID
                         FOR XML PATH(''), TYPE).value('.', 'NVARCHAR(MAX)'), 1, 2, ''), N'') AS ROLES
    FROM dbo.TBL_USER2 u
    ORDER BY u.U_ID;
END
GO

IF OBJECT_ID('dbo.pro_user_get') IS NOT NULL DROP PROCEDURE dbo.pro_user_get;
GO
CREATE PROCEDURE dbo.pro_user_get
    @U_ID INT
AS
BEGIN
    SET NOCOUNT ON;
    SELECT u.U_ID, u.U_NAME, u.U_FULLNAME, u.U_EMAIL, u.U_ACTIVE,
           ISNULL(STUFF((SELECT ',' + CAST(ur.ROLE_ID AS VARCHAR(10))
                         FROM dbo.TBL_USER_ROLE ur
                         WHERE ur.U_ID = u.U_ID
                         FOR XML PATH('')), 1, 1, ''), '') AS ROLE_IDS
    FROM dbo.TBL_USER2 u
    WHERE u.U_ID = @U_ID;
END
GO

/* Thêm / sửa user. Mật khẩu lưu nguyên văn.
   Sửa user: @U_PASSWORD = '' thì giữ mật khẩu cũ.
   Cột ROLE cũ được cập nhật theo nhóm chính để code cũ (Session["role"]) vẫn chạy. */
IF OBJECT_ID('dbo.pro_user_save') IS NOT NULL DROP PROCEDURE dbo.pro_user_save;
GO
CREATE PROCEDURE dbo.pro_user_save
    @U_ID       INT,             -- 0 = thêm mới
    @U_NAME     NVARCHAR(100),
    @U_PASSWORD NVARCHAR(200),
    @U_FULLNAME NVARCHAR(200),
    @U_EMAIL    NVARCHAR(200),
    @U_ACTIVE   VARCHAR(1),      -- 'Y' / 'N'
    @ROLE_IDS   VARCHAR(MAX)     -- '1,3'
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    IF EXISTS (SELECT 1 FROM dbo.TBL_USER2 WHERE U_NAME = @U_NAME AND U_ID <> @U_ID)
    BEGIN
        SELECT 'DUP' AS RESULT, @U_ID AS U_ID; RETURN;
    END

    DECLARE @roles TABLE (ROLE_ID INT PRIMARY KEY);
    IF LEN(ISNULL(@ROLE_IDS, '')) > 0
    BEGIN
        DECLARE @x XML = CAST('<i>' + REPLACE(@ROLE_IDS, ',', '</i><i>') + '</i>' AS XML);
        INSERT @roles (ROLE_ID)
        SELECT DISTINCT r.ROLE_ID
        FROM @x.nodes('/i') t(i)
        JOIN dbo.TBL_ROLE r ON r.ROLE_ID = t.i.value('.', 'INT');
    END

    BEGIN TRAN;

    IF @U_ID = 0
    BEGIN
        IF COLUMNPROPERTY(OBJECT_ID('dbo.TBL_USER2'), 'U_ID', 'IsIdentity') = 1
        BEGIN
            INSERT dbo.TBL_USER2 (U_NAME, U_PASSWORD, U_FULLNAME, U_EMAIL, U_ACTIVE, INSERT_DATE)
            VALUES (@U_NAME, @U_PASSWORD, @U_FULLNAME, NULLIF(@U_EMAIL, ''), @U_ACTIVE, GETDATE());
            SET @U_ID = SCOPE_IDENTITY();
        END
        ELSE
        BEGIN
            SELECT @U_ID = ISNULL(MAX(U_ID), 0) + 1 FROM dbo.TBL_USER2 WITH (UPDLOCK, HOLDLOCK);
            INSERT dbo.TBL_USER2 (U_ID, U_NAME, U_PASSWORD, U_FULLNAME, U_EMAIL, U_ACTIVE, INSERT_DATE)
            VALUES (@U_ID, @U_NAME, @U_PASSWORD, @U_FULLNAME, NULLIF(@U_EMAIL, ''), @U_ACTIVE, GETDATE());
        END
    END
    ELSE
    BEGIN
        UPDATE dbo.TBL_USER2
        SET U_NAME     = @U_NAME,
            U_PASSWORD = CASE WHEN ISNULL(@U_PASSWORD, '') = '' THEN U_PASSWORD ELSE @U_PASSWORD END,
            U_FULLNAME = @U_FULLNAME,
            U_EMAIL    = NULLIF(@U_EMAIL, ''),
            U_ACTIVE   = @U_ACTIVE
        WHERE U_ID = @U_ID;
    END

    -- Gán nhóm
    DELETE dbo.TBL_USER_ROLE WHERE U_ID = @U_ID;
    INSERT dbo.TBL_USER_ROLE (U_ID, ROLE_ID) SELECT @U_ID, ROLE_ID FROM @roles;

    -- Đồng bộ cột ROLE cũ: admin > NV > nhóm khác
    UPDATE dbo.TBL_USER2
    SET ROLE = ISNULL((SELECT TOP 1 CASE r.ROLE_CODE WHEN 'ADMIN' THEN 'admin'
                                                     WHEN 'ORDER' THEN 'order'
                                                     ELSE r.ROLE_CODE END
                       FROM dbo.TBL_USER_ROLE ur
                       JOIN dbo.TBL_ROLE r ON r.ROLE_ID = ur.ROLE_ID
                       WHERE ur.U_ID = @U_ID
                       ORDER BY CASE r.ROLE_CODE WHEN 'ADMIN' THEN 0 WHEN 'NV' THEN 1 ELSE 2 END, r.ROLE_ID), '')
    WHERE U_ID = @U_ID;

    -- Luôn phải còn ít nhất 1 admin đang hoạt động
    IF NOT EXISTS (SELECT 1 FROM dbo.TBL_USER2 u
                   JOIN dbo.TBL_USER_ROLE ur ON ur.U_ID = u.U_ID
                   JOIN dbo.TBL_ROLE r       ON r.ROLE_ID = ur.ROLE_ID AND r.ROLE_CODE = 'ADMIN'
                   WHERE u.U_ACTIVE = 'Y')
    BEGIN
        ROLLBACK;
        SELECT 'NOADMIN' AS RESULT, @U_ID AS U_ID; RETURN;
    END

    COMMIT;
    SELECT 'OK' AS RESULT, @U_ID AS U_ID;
END
GO

/* Khóa / mở khóa user */
IF OBJECT_ID('dbo.pro_user_toggle_active') IS NOT NULL DROP PROCEDURE dbo.pro_user_toggle_active;
GO
CREATE PROCEDURE dbo.pro_user_toggle_active
    @U_ID INT
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    BEGIN TRAN;
        UPDATE dbo.TBL_USER2
        SET U_ACTIVE = CASE WHEN U_ACTIVE = 'Y' THEN 'N' ELSE 'Y' END
        WHERE U_ID = @U_ID;

        IF NOT EXISTS (SELECT 1 FROM dbo.TBL_USER2 u
                       JOIN dbo.TBL_USER_ROLE ur ON ur.U_ID = u.U_ID
                       JOIN dbo.TBL_ROLE r       ON r.ROLE_ID = ur.ROLE_ID AND r.ROLE_CODE = 'ADMIN'
                       WHERE u.U_ACTIVE = 'Y')
        BEGIN
            ROLLBACK;
            SELECT 'NOADMIN' AS RESULT, '' AS U_ACTIVE; RETURN;
        END
    COMMIT;

    SELECT 'OK' AS RESULT, U_ACTIVE FROM dbo.TBL_USER2 WHERE U_ID = @U_ID;
END
GO
