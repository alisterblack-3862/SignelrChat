using MessageApp.Data;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Mvc;
using Signalrchat.Models;
using System.Diagnostics;

namespace Signalrchat.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private readonly ApplicationDbContext _context ;

        public HomeController(ILogger<HomeController> logger ,ApplicationDbContext context)
        {
            _logger = logger;
            _context=context;
        }

        public IActionResult Index()
        {
            return View();
        }

        public IActionResult Privacy()
        {
            return View();
        }
        public IActionResult Login()
        {
            return View();
        }
          [HttpPost]
        [Route("Home/Login")]
        public IActionResult Login(LoginModel model)
        {
            if (ModelState.IsValid)
            {
                var user=_context.Students.Where(s=>s.Email== model.UserName && s.Password==model.Password).FirstOrDefault();
                if (user != null)
                {
                    
                    HttpContext.Session.SetString("AuthToken", user.Email+"_"+ user.Id);
                    HttpContext.Session.SetString("UserName", user.Email);
                    HttpContext.Session.SetInt32("UserId", user.Id);
                    return RedirectToAction("JoinRoom", "Chat");
                }
                else
                {
                    //ModelState.AddModelError(string.Empty, "Invalid login attempt.");
                    ViewBag.Message = "Invalid Login Attempt";
                    return View();
                }
            }
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
