using MessageApp.Data;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Signalrchat.Hubs;
using Signalrchat.Models;

namespace Signalrchat.Controllers
{
    public class ChatController : Controller
    {
        private readonly ApplicationDbContext _context;

        public ChatController( ApplicationDbContext context)
        {
            _context = context;
        }
        [HttpGet]
        public IActionResult JoinRoom()
        {
            List<Studentdetail> studentdetails = new List<Studentdetail>();
            var currentuser = HttpContext.Session.GetString("UserName");
            studentdetails = _context.Students
            .Select(s => new Studentdetail
            {
                Id = s.Id,
                Name = s.Name,
                Email = s.Email,
                Image = s.Image,
                Mobile = s.Mobile
            }).Where(s=> s.Email != currentuser)
            .ToList();
            ViewBag.username= currentuser;
            return View(studentdetails);
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

        public JsonResult GetRoomname(string UserEmail)
        {
            var currentuser = HttpContext.Session.GetString("UserName");
var all=_context.ChatRoom.ToList();
            // Check if a chat room already exists for the users
            var existingRoom = _context.ChatRoom.Where(s =>
                (s.User1 == currentuser && s.User2 == UserEmail) ||
                (s.User1 == UserEmail && s.User2 == currentuser)).FirstOrDefault();

            if (existingRoom != null)
            {
                // Return the existing room name
                return Json(new { roomname = existingRoom.CommonRoom });
            }
            else
            {
                var roomname = Guid.NewGuid().ToString();
                // Create a new chat room
                var newRoom = new ChatRooms
                {
                    User1 = currentuser,
                    User2 = UserEmail,
                    CommonRoom = roomname, 
                    CreatedDate = DateTime.Now.ToString()
                };

                _context.ChatRoom.Add(newRoom);
                _context.SaveChanges();

                // Return the new room name
                return Json(new { roomname = newRoom.CommonRoom });
            }
        }

    }
}
