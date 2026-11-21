/* =====================================================================
   PHÂN QUYỀN CHI TIẾT (RBAC) - DỮ LIỆU KHỞI TẠO
   Database: DataNhaHang
   - Tạo bảng nếu chưa có (chạy lại nhiều lần không bị trùng dữ liệu)
   - Thêm nhóm quyền, module (theo menu Site.Master), quyền chi tiết
   - Gán quyền cho nhóm ADMIN / NV / ORDER
   - Gán user hiện có trong TBL_USER2 vào nhóm theo cột ROLE
   ===================================================================== */
USE DataNhaHang;
GO
SET NOCOUNT ON;
GO

/* ---------- 1. TẠO BẢNG (nếu chưa có) ---------- */
IF OBJECT_ID('dbo.TBL_ROLE') IS NULL
CREATE TABLE dbo.TBL_ROLE (
    ROLE_ID    INT IDENTITY PRIMARY KEY,
    ROLE_CODE  VARCHAR(50)   NOT NULL UNIQUE,
    ROLE_NAME  NVARCHAR(100) NOT NULL,
    IS_ACTIVE  BIT NOT NULL DEFAULT 1
);

IF OBJECT_ID('dbo.TBL_MODULE') IS NULL
CREATE TABLE dbo.TBL_MODULE (
    MODULE_ID   INT IDENTITY PRIMARY KEY,
    MODULE_CODE VARCHAR(50)   NOT NULL UNIQUE,
    MODULE_NAME NVARCHAR(100) NOT NULL,
    PARENT_ID   INT NULL REFERENCES dbo.TBL_MODULE(MODULE_ID),
    URL         VARCHAR(200) NULL,
    SORT_ORDER  INT NOT NULL DEFAULT 0,
    IS_MENU     BIT NOT NULL DEFAULT 1
);

IF OBJECT_ID('dbo.TBL_PERMISSION') IS NULL
CREATE TABLE dbo.TBL_PERMISSION (
    PERM_ID     INT IDENTITY PRIMARY KEY,
    MODULE_ID   INT NOT NULL REFERENCES dbo.TBL_MODULE(MODULE_ID),
    ACTION_CODE VARCHAR(30)   NOT NULL,
    PERM_CODE   VARCHAR(100)  NOT NULL UNIQUE,
    PERM_NAME   NVARCHAR(150) NOT NULL
);

IF OBJECT_ID('dbo.TBL_ROLE_PERMISSION') IS NULL
CREATE TABLE dbo.TBL_ROLE_PERMISSION (
    ROLE_ID INT NOT NULL REFERENCES dbo.TBL_ROLE(ROLE_ID),
    PERM_ID INT NOT NULL REFERENCES dbo.TBL_PERMISSION(PERM_ID),
    PRIMARY KEY (ROLE_ID, PERM_ID)
);

IF OBJECT_ID('dbo.TBL_USER_ROLE') IS NULL
CREATE TABLE dbo.TBL_USER_ROLE (
    U_ID    INT NOT NULL,
    ROLE_ID INT NOT NULL REFERENCES dbo.TBL_ROLE(ROLE_ID),
    PRIMARY KEY (U_ID, ROLE_ID)
);

IF OBJECT_ID('dbo.TBL_USER_PERMISSION') IS NULL
CREATE TABLE dbo.TBL_USER_PERMISSION (
    U_ID     INT NOT NULL,
    PERM_ID  INT NOT NULL REFERENCES dbo.TBL_PERMISSION(PERM_ID),
    IS_GRANT BIT NOT NULL,
    PRIMARY KEY (U_ID, PERM_ID)
);
GO

/* ---------- 2. DỮ LIỆU ---------- */
SET XACT_ABORT ON;
BEGIN TRAN;

/* 2.1 Danh sách hành động */
DECLARE @act TABLE (ACTION_CODE VARCHAR(30), ACTION_NAME NVARCHAR(50));
INSERT @act VALUES
 ('VIEW',    N'Xem'),
 ('ADD',     N'Thêm'),
 ('EDIT',    N'Sửa'),
 ('DELETE',  N'Xóa'),
 ('PRINT',   N'In'),
 ('EXPORT',  N'Xuất Excel'),
 ('APPROVE', N'Duyệt');

/* 2.2 Nhóm quyền */
INSERT dbo.TBL_ROLE (ROLE_CODE, ROLE_NAME)
SELECT v.c, v.n
FROM (VALUES ('ADMIN', N'Quản trị hệ thống'),
             ('NV',    N'Nhân viên'),
             ('ORDER', N'Nhân viên order')) v(c, n)
WHERE NOT EXISTS (SELECT 1 FROM dbo.TBL_ROLE r WHERE r.ROLE_CODE = v.c);

/* 2.3 Module (theo menu Site.Master)
   ACTIONS = các hành động có trong module, cách nhau bằng dấu phẩy.
   Nhóm menu (GRP_...) không có hành động, chỉ dùng để gom menu. */
DECLARE @m TABLE (
    CODE VARCHAR(50), NAME NVARCHAR(100), PARENT VARCHAR(50), URL VARCHAR(200),
    SORT INT, IS_MENU BIT, ACTIONS VARCHAR(200));

INSERT @m VALUES
-- Trang chính
 ('HOME',            N'Trang chủ',                   NULL, 'Default.aspx',             1, 1, 'VIEW'),
 ('NHAHANG',         N'Nhà hàng (sơ đồ bàn)',        NULL, 'Map.aspx',                 2, 1, 'VIEW,ADD,EDIT,DELETE,PRINT'),
 ('PHIEUNHAP',       N'Phiếu nhập hàng',             NULL, 'Phieunhaphang.aspx',       3, 1, 'VIEW,ADD,EDIT,DELETE,PRINT,EXPORT'),
 ('PHIEUBAN',        N'Phiếu bán hàng',              NULL, 'Phieubanhang.aspx',        4, 1, 'VIEW,ADD,EDIT,DELETE,PRINT,EXPORT'),
 ('ORDER_NV',        N'Order nhân viên',             NULL, 'OrderNhanVien.aspx',       5, 1, 'VIEW,ADD,EDIT,DELETE'),

-- SỔ QUỸ
 ('GRP_SOQUY',       N'SỔ QUỸ',                      NULL, NULL,                      10, 1, ''),
 ('PHIEUCHI',        N'Phiếu chi',                   'GRP_SOQUY', 'Phieuchi.aspx',     1, 1, 'VIEW,ADD,EDIT,DELETE,PRINT,EXPORT,APPROVE'),
 ('PHIEUTHU',        N'Phiếu thu',                   'GRP_SOQUY', 'Phieuthu.aspx',     2, 1, 'VIEW,ADD,EDIT,DELETE,PRINT,EXPORT,APPROVE'),
 ('BC_SOQUY',        N'BC tổng hợp thu chi',         'GRP_SOQUY', 'Report/Baocaosoquy.aspx', 3, 1, 'VIEW,PRINT,EXPORT'),

-- BÁO CÁO
 ('GRP_BAOCAO',      N'BÁO CÁO',                     NULL, NULL,                      20, 1, ''),
 ('BC_BH_HD',        N'BC bán hàng theo HĐ',         'GRP_BAOCAO', 'Report/BaocaoBH.aspx',          1, 1, 'VIEW,PRINT,EXPORT'),
 ('BC_BH_GIO',       N'BC bán hàng theo giờ',        'GRP_BAOCAO', 'Report/BaocaoBHtheogio.aspx',   2, 1, 'VIEW,PRINT,EXPORT'),
 ('BC_TH_BH',        N'BC tổng hợp bán hàng',        'GRP_BAOCAO', 'Report/BaocaotonghopBH.aspx',   3, 1, 'VIEW,PRINT,EXPORT'),
 ('BC_NH_HD',        N'BC nhập hàng theo HĐ',        'GRP_BAOCAO', 'Report/Baocaonhaphang.aspx',    4, 1, 'VIEW,PRINT,EXPORT'),
 ('BC_TH_NH',        N'BC tổng hợp nhập hàng',       'GRP_BAOCAO', 'Report/BaocaotonghopNH.aspx',   5, 1, 'VIEW,PRINT,EXPORT'),
 ('BC_TONKHO',       N'BC tồn kho',                  'GRP_BAOCAO', 'Report/Baocaotonkho.aspx',      6, 1, 'VIEW,PRINT,EXPORT'),
 ('CANDOI_TONKHO',   N'Cân đối tồn kho',             'GRP_BAOCAO', 'Report/Phieucandoitonkho.aspx', 7, 1, 'VIEW,ADD,EDIT,DELETE,PRINT,EXPORT,APPROVE'),
 ('GRP_BC_CONGNO',   N'BC công nợ',                  'GRP_BAOCAO', NULL,                            8, 1, ''),
 ('BC_CONGNO_KH',    N'Công nợ KH',                  'GRP_BC_CONGNO', 'Report/BaocaocongnoKH.aspx', 1, 1, 'VIEW,PRINT,EXPORT'),
 ('BC_CONGNO_NCC',   N'Công nợ NCC',                 'GRP_BC_CONGNO', 'Report/BaocaocongnoNCC.aspx',2, 1, 'VIEW,PRINT,EXPORT'),
 ('BC_LOLAI',        N'BC lỗ lãi',                   'GRP_BAOCAO', 'Report/Baocaololai.aspx',       9, 1, 'VIEW,PRINT,EXPORT'),

-- DANH MỤC
 ('GRP_DANHMUC',     N'DANH MỤC',                    NULL, NULL,                      30, 1, ''),
 ('DM_HANGHOA',      N'Danh mục hàng hóa',           'GRP_DANHMUC', 'Danhmuc/Danhmuchanghoa.aspx',    1, 1, 'VIEW,ADD,EDIT,DELETE,EXPORT'),
 ('DM_KHACHHANG',    N'Danh mục khách hàng',         'GRP_DANHMUC', 'Danhmuc/Danhmuckhachhang.aspx',  2, 1, 'VIEW,ADD,EDIT,DELETE,EXPORT'),
 ('DM_BANPHONG',     N'Danh mục bàn/phòng',          'GRP_DANHMUC', 'Danhmuc/Danhmucbanphong.aspx',   3, 1, 'VIEW,ADD,EDIT,DELETE,EXPORT'),
 ('DM_KHUVUC',       N'Danh mục khu vực',            'GRP_DANHMUC', 'Danhmuc/DMKhuvuc.aspx',          4, 1, 'VIEW,ADD,EDIT,DELETE,EXPORT'),
 ('DM_NHOMHANG',     N'Danh mục nhóm hàng',          'GRP_DANHMUC', 'Danhmuc/Danhmucnhomhang.aspx',   5, 1, 'VIEW,ADD,EDIT,DELETE,EXPORT'),
 ('DM_NCC',          N'Danh mục NCC',                'GRP_DANHMUC', 'Danhmuc/Danhmucnhacungcap.aspx', 6, 1, 'VIEW,ADD,EDIT,DELETE,EXPORT'),
 ('DM_CAUTHANH_DVT', N'Danh mục cấu thành ĐVT',      'GRP_DANHMUC', 'Danhmuc/DMcauthanhDVT.aspx',     7, 1, 'VIEW,ADD,EDIT,DELETE,EXPORT'),
 ('DM_CAUTHANH_SP',  N'Danh mục cấu thành sản phẩm', 'GRP_DANHMUC', 'Danhmuc/DMcauthanhsanpham.aspx', 8, 1, 'VIEW,ADD,EDIT,DELETE,EXPORT'),
 ('DM_NHANVIEN',     N'Danh mục nhân viên',          'GRP_DANHMUC', 'Danhmuc/Danhmucnhanvien.aspx',   9, 1, 'VIEW,ADD,EDIT,DELETE,EXPORT'),

-- LIÊN HỆ
 ('GRP_LIENHE',      N'LIÊN HỆ',                     NULL, NULL,                      40, 1, ''),
 ('DM_DONVI',        N'Thông tin doanh nghiệp',      'GRP_LIENHE', 'Danhmuc/Danhmucdonvi.aspx', 1, 1, 'VIEW,EDIT'),
 ('DATHANG_ONLINE',  N'Đặt hàng online',             'GRP_LIENHE', '#',                        2, 1, 'VIEW'),
 ('LIENHE_TRUCTIEP', N'Liên hệ trực tiếp',           'GRP_LIENHE', '#',                        3, 1, 'VIEW'),
 ('MAKE_QR',         N'Tạo QR code',                 'GRP_LIENHE', 'MakeQR.aspx',              4, 1, 'VIEW,PRINT'),
 ('IN_BARCODE',      N'Tạo QR DM hàng hóa',          'GRP_LIENHE', 'Inbarcode.aspx',           5, 1, 'VIEW,PRINT'),
 ('SQL_DATA',        N'Sql data',                    'GRP_LIENHE', 'TemplateReport/hethongbaocadong.aspx', 6, 1, 'VIEW,EXPORT'),

-- HỆ THỐNG (mới - chỉ admin)
 ('GRP_HETHONG',     N'HỆ THỐNG',                    NULL, NULL,                      50, 1, ''),
 ('SYS_NGUOIDUNG',   N'Quản lý người dùng',          'GRP_HETHONG', 'Hethong/Nguoidung.aspx', 1, 1, 'VIEW,ADD,EDIT,DELETE'),
 ('SYS_PHANQUYEN',   N'Phân quyền',                  'GRP_HETHONG', 'Hethong/Phanquyen.aspx', 2, 1, 'VIEW,EDIT');

/* Thêm module chưa có */
INSERT dbo.TBL_MODULE (MODULE_CODE, MODULE_NAME, URL, SORT_ORDER, IS_MENU)
SELECT m.CODE, m.NAME, m.URL, m.SORT, m.IS_MENU
FROM @m m
WHERE NOT EXISTS (SELECT 1 FROM dbo.TBL_MODULE x WHERE x.MODULE_CODE = m.CODE);

/* Gán module cha */
UPDATE c SET c.PARENT_ID = p.MODULE_ID
FROM dbo.TBL_MODULE c
JOIN @m m             ON m.CODE = c.MODULE_CODE
JOIN dbo.TBL_MODULE p ON p.MODULE_CODE = m.PARENT;

/* 2.4 Sinh quyền chi tiết: <MODULE_CODE>.<ACTION_CODE>, ví dụ PHIEUCHI.DELETE */
INSERT dbo.TBL_PERMISSION (MODULE_ID, ACTION_CODE, PERM_CODE, PERM_NAME)
SELECT md.MODULE_ID, a.ACTION_CODE,
       m.CODE + '.' + a.ACTION_CODE,
       a.ACTION_NAME + N' - ' + m.NAME
FROM @m m
JOIN dbo.TBL_MODULE md ON md.MODULE_CODE = m.CODE
JOIN @act a ON CHARINDEX(',' + a.ACTION_CODE + ',', ',' + m.ACTIONS + ',') > 0
WHERE NOT EXISTS (SELECT 1 FROM dbo.TBL_PERMISSION p
                  WHERE p.PERM_CODE = m.CODE + '.' + a.ACTION_CODE);

/* 2.5 ADMIN: toàn bộ quyền */
INSERT dbo.TBL_ROLE_PERMISSION (ROLE_ID, PERM_ID)
SELECT r.ROLE_ID, p.PERM_ID
FROM dbo.TBL_ROLE r
CROSS JOIN dbo.TBL_PERMISSION p
WHERE r.ROLE_CODE = 'ADMIN'
  AND NOT EXISTS (SELECT 1 FROM dbo.TBL_ROLE_PERMISSION x
                  WHERE x.ROLE_ID = r.ROLE_ID AND x.PERM_ID = p.PERM_ID);

/* 2.6 NV và ORDER: chỉ những quyền liệt kê dưới đây */
DECLARE @rp TABLE (ROLE_CODE VARCHAR(50), MODULE_CODE VARCHAR(50), ACTIONS VARCHAR(200));
INSERT @rp VALUES
-- NV: bán hàng, nhập hàng, danh mục (không xóa, không có sổ quỹ / báo cáo / nhân viên / Sql data)
 ('NV', 'HOME',            'VIEW'),
 ('NV', 'NHAHANG',         'VIEW,ADD,EDIT,PRINT'),
 ('NV', 'PHIEUNHAP',       'VIEW,ADD,EDIT,PRINT'),
 ('NV', 'PHIEUBAN',        'VIEW,ADD,EDIT,PRINT'),
 ('NV', 'DM_HANGHOA',      'VIEW,ADD,EDIT'),
 ('NV', 'DM_KHACHHANG',    'VIEW,ADD,EDIT'),
 ('NV', 'DM_BANPHONG',     'VIEW,ADD,EDIT'),
 ('NV', 'DM_KHUVUC',       'VIEW,ADD,EDIT'),
 ('NV', 'DM_NHOMHANG',     'VIEW,ADD,EDIT'),
 ('NV', 'DM_NCC',          'VIEW,ADD,EDIT'),
 ('NV', 'DM_CAUTHANH_DVT', 'VIEW,ADD,EDIT'),
 ('NV', 'DM_CAUTHANH_SP',  'VIEW,ADD,EDIT'),
 ('NV', 'DM_DONVI',        'VIEW'),
 ('NV', 'DATHANG_ONLINE',  'VIEW'),
 ('NV', 'LIENHE_TRUCTIEP', 'VIEW'),
 ('NV', 'MAKE_QR',         'VIEW,PRINT'),
 ('NV', 'IN_BARCODE',      'VIEW,PRINT'),
-- ORDER: chỉ gọi món
 ('ORDER', 'ORDER_NV',     'VIEW,ADD,EDIT'),
 ('ORDER', 'NHAHANG',      'VIEW');

INSERT dbo.TBL_ROLE_PERMISSION (ROLE_ID, PERM_ID)
SELECT DISTINCT r.ROLE_ID, p.PERM_ID
FROM @rp x
JOIN dbo.TBL_ROLE r       ON r.ROLE_CODE = x.ROLE_CODE
JOIN dbo.TBL_MODULE md    ON md.MODULE_CODE = x.MODULE_CODE
JOIN dbo.TBL_PERMISSION p ON p.MODULE_ID = md.MODULE_ID
                         AND CHARINDEX(',' + p.ACTION_CODE + ',', ',' + x.ACTIONS + ',') > 0
WHERE NOT EXISTS (SELECT 1 FROM dbo.TBL_ROLE_PERMISSION y
                  WHERE y.ROLE_ID = r.ROLE_ID AND y.PERM_ID = p.PERM_ID);

/* 2.7 Gán user hiện có vào nhóm theo cột ROLE cũ (admin -> ADMIN, NV -> NV, order -> ORDER) */
INSERT dbo.TBL_USER_ROLE (U_ID, ROLE_ID)
SELECT u.U_ID, r.ROLE_ID
FROM dbo.TBL_USER2 u
JOIN dbo.TBL_ROLE r ON r.ROLE_CODE = UPPER(LTRIM(RTRIM(u.ROLE)))
WHERE NOT EXISTS (SELECT 1 FROM dbo.TBL_USER_ROLE x
                  WHERE x.U_ID = u.U_ID AND x.ROLE_ID = r.ROLE_ID);

COMMIT;
GO

/* ---------- 3. STORE LẤY QUYỀN CỦA USER ---------- */
IF OBJECT_ID('dbo.pro_user_get_permissions') IS NOT NULL
    DROP PROCEDURE dbo.pro_user_get_permissions;
GO
CREATE PROCEDURE dbo.pro_user_get_permissions
    @U_ID INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT p.PERM_CODE
    FROM dbo.TBL_USER_ROLE ur
    JOIN dbo.TBL_ROLE r             ON r.ROLE_ID = ur.ROLE_ID AND r.IS_ACTIVE = 1
    JOIN dbo.TBL_ROLE_PERMISSION rp ON rp.ROLE_ID = ur.ROLE_ID
    JOIN dbo.TBL_PERMISSION p       ON p.PERM_ID = rp.PERM_ID
    WHERE ur.U_ID = @U_ID
      AND NOT EXISTS (SELECT 1 FROM dbo.TBL_USER_PERMISSION up
                      WHERE up.U_ID = @U_ID AND up.PERM_ID = p.PERM_ID AND up.IS_GRANT = 0)
    UNION
    SELECT p.PERM_CODE
    FROM dbo.TBL_USER_PERMISSION up
    JOIN dbo.TBL_PERMISSION p ON p.PERM_ID = up.PERM_ID
    WHERE up.U_ID = @U_ID AND up.IS_GRANT = 1;
END
GO

/* ---------- 4. KIỂM TRA ---------- */
-- Số quyền của từng user
SELECT u.U_ID, u.U_NAME, u.U_FULLNAME, r.ROLE_CODE, COUNT(rp.PERM_ID) AS SO_QUYEN
FROM dbo.TBL_USER2 u
LEFT JOIN dbo.TBL_USER_ROLE ur       ON ur.U_ID = u.U_ID
LEFT JOIN dbo.TBL_ROLE r             ON r.ROLE_ID = ur.ROLE_ID
LEFT JOIN dbo.TBL_ROLE_PERMISSION rp ON rp.ROLE_ID = r.ROLE_ID
GROUP BY u.U_ID, u.U_NAME, u.U_FULLNAME, r.ROLE_CODE
ORDER BY u.U_ID;

-- Danh sách quyền của user 'tuananh' (U_ID = 3)
EXEC dbo.pro_user_get_permissions @U_ID = 3;

/* ---------- 5. VÍ DỤ NGOẠI LỆ THEO USER (bỏ comment nếu cần) ---------- */
-- Cho riêng nhanvien1 (U_ID = 5) được XÓA phiếu bán hàng:
-- INSERT dbo.TBL_USER_PERMISSION (U_ID, PERM_ID, IS_GRANT)
-- SELECT 5, PERM_ID, 1 FROM dbo.TBL_PERMISSION WHERE PERM_CODE = 'PHIEUBAN.DELETE';

-- Cấm riêng nhanvien2 (U_ID = 6) sửa danh mục hàng hóa:
-- INSERT dbo.TBL_USER_PERMISSION (U_ID, PERM_ID, IS_GRANT)
-- SELECT 6, PERM_ID, 0 FROM dbo.TBL_PERMISSION WHERE PERM_CODE = 'DM_HANGHOA.EDIT';
