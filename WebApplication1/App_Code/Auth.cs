using System;
using System.Collections.Generic;
using System.Data;
using System.Web;

namespace WebApplication1.App_Code
{
    public static class Auth
    {
        const string KEY = "perms";

        // Gọi 1 lần sau khi đăng nhập thành công
        public static void LoadPermissions(int userId)
        {
            DataTable dt = DataConn.StoreFillDS("pro_user_get_permissions",CommandType.StoredProcedure, userId);
            var set = new HashSet<string>(StringComparer.OrdinalIgnoreCase);
            foreach (DataRow r in dt.Rows) set.Add(r["PERM_CODE"].ToString());
            HttpContext.Current.Session[KEY] = set;
        }

        public static bool Has(string permCode)
        {
            var set = HttpContext.Current.Session?[KEY] as HashSet<string>;
            return set != null && set.Contains(permCode);
        }

        // Dùng trong event handler / WebMethod: không có quyền thì chặn luôn
        public static void Require(string permCode)
        {
            if (!Has(permCode))
                throw new HttpException(403, "Bạn không có quyền: " + permCode);
        }
    }
}