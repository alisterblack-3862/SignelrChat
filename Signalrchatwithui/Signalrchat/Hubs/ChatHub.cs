using Microsoft.AspNetCore.SignalR;
using Signalrchat.Models;
using System;

namespace Signalrchat.Hubs
{
    public class ChatHub : Hub
    {
        private readonly IDictionary<string, UserRoomConnection> _connection;

        public ChatHub(IDictionary<string, UserRoomConnection> connection)
        {
            _connection = connection;
        }


        public async Task JoinRoom(UserRoomConnection userConnection)
        {

            // Add the client to the specified SignalR group
            await Groups.AddToGroupAsync(Context.ConnectionId, userConnection.Room!);

            // Update the _connection dictionary with the current connection ID
            _connection[Context.ConnectionId] = userConnection;

            var currentTime = DateTime.Now;
            string formattedTime = "Today " + currentTime.ToString("HH:mm");

            await Clients.Group(userConnection.Room!)
                .SendAsync("ReceiveMessage", userConnection.User, "has Joined the Group", formattedTime);

            await SendConnectedUser(userConnection.Room!);
        }

        public async Task SendMessage(string message)
        {
            if (_connection.TryGetValue(Context.ConnectionId, out UserRoomConnection userRoomConnection))
            {
                var currentTime = DateTime.Now;
                string formattedTime = "Today " + currentTime.ToString("HH:mm");
                await Clients.Group(userRoomConnection.Room!)
                    .SendAsync("ReceiveMessage", userRoomConnection.User, message, formattedTime);
            }
        }




        public override Task OnDisconnectedAsync(Exception? exp)
        {
            if (!_connection.TryGetValue(Context.ConnectionId, out UserRoomConnection roomConnection))
            {
                return base.OnDisconnectedAsync(exp);
            }

            _connection.Remove(Context.ConnectionId);

            var currentTime = DateTime.Now;
            string formattedTime = "Today " + currentTime.ToString("HH:mm");

            Clients.Group(roomConnection.Room!)
                .SendAsync("ReceiveMessage", roomConnection.User, $" has Left the Group", formattedTime);
            SendConnectedUser(roomConnection.Room!);
            return base.OnDisconnectedAsync(exp);
        }

        public Task SendConnectedUser(string room)
        {
            var users = _connection.Values
                .Where(u => u.Room == room)
                .Select(s => s.User);
            return Clients.Group(room).SendAsync("ConnectedUser", users);
        }
    }

    //public class ChatHub : Hub
    //{

    //    private readonly Dictionary<string, List<string>> _userRooms = new Dictionary<string, List<string>>();

    //    public async Task SendMessage(string user, string message)
    //    {
    //        var currentTime = DateTime.Now;

    //        string formattedTime;
    //        formattedTime = "Today " + currentTime.ToString("HH:mm");
    //        Clients.All.SendAsync("ReciveMessage",user, message, formattedTime);
    //    }
    //    public async Task JoinRoom(string room)
    //    {
    //        // Create the room if it doesn't exist
    //        if (!_userRooms.ContainsKey(Context.ConnectionId))
    //        {
    //            _userRooms.Add(Context.ConnectionId, new List<string>());
    //        }

    //        // Add the user to the room
    //        _userRooms[Context.ConnectionId].Add(room);

    //        // Add the connection to the SignalR group for the room
    //        await Groups.AddToGroupAsync(Context.ConnectionId, room);
    //    }

    //    public async Task LeaveRoom(string room)
    //    {
    //        // Remove the user from the room
    //        if (_userRooms.ContainsKey(Context.ConnectionId))
    //        {
    //            _userRooms[Context.ConnectionId].Remove(room);

    //            // Remove the connection from the SignalR group for the room
    //            await Groups.RemoveFromGroupAsync(Context.ConnectionId, room);

    //            // Remove the connection from the dictionary if the user is in no rooms
    //            if (_userRooms[Context.ConnectionId].Count == 0)
    //            {
    //                _userRooms.Remove(Context.ConnectionId);
    //            }
    //        }
    //    }

    //    public override async Task OnDisconnectedAsync(Exception exception)
    //    {
    //        // Remove the user from all rooms when they disconnect
    //        if (_userRooms.ContainsKey(Context.ConnectionId))
    //        {
    //            foreach (var room in _userRooms[Context.ConnectionId])
    //            {
    //                await Groups.RemoveFromGroupAsync(Context.ConnectionId, room);
    //            }

    //            _userRooms.Remove(Context.ConnectionId);
    //        }

    //        await base.OnDisconnectedAsync(exception);
    //    }
    //}


}

