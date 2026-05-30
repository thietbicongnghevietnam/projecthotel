using Microsoft.AspNet.SignalR;

public class TableHub : Hub
{
    public static void UpdateTableStatus(string tenphong, string trangthai)
    {
        var context = GlobalHost.ConnectionManager.GetHubContext<TableHub>();
        context.Clients.All.updateTable(tenphong, trangthai);
    }
}