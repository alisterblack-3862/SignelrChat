using Microsoft.AspNetCore.Mvc;
using Signalrchat.Hubs;
using Signalrchat.Models;

namespace Signalrchat.Controllers
{
    public class ChatController : Controller
    {
        [HttpGet]
        public IActionResult JoinRoom()
        {
            return View();
        }

        [HttpPost]
        public IActionResult JoinRoom(JoinRoomModel model)
        {
            if (ModelState.IsValid)
            {
                
                TempData["User"] = model.User;
                TempData["Room"] = model.Room;
                UserRoomConnection join=new UserRoomConnection();
                join.Room = model.Room;
                join.User = model.User;
                return RedirectToAction("Chat");
            }

            return View(model);
        }

        public IActionResult Chat()
        {
            //if (TempData["User"] == null || TempData["Room"] == null)
            //{
            //    return RedirectToAction("JoinRoom");
            //}

            ViewBag.LoggedInUserName = TempData["User"];
            ViewBag.RoomName = TempData["Room"];
            return View();
        }
    }
}
