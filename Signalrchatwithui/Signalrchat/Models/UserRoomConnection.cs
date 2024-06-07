using System.ComponentModel.DataAnnotations;

namespace Signalrchat.Models
{
    public class Studentdetail
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Email { get; set; }
        public string Mobile { get; set; }
        public string Password { get; set; }
        public string Image { get; set; }
    }
    public class UserRoomConnection
    {
        public string? User { get; set; }
        public string? Room { get; set; }
    }
    public class JoinRoomModel
    {
        [Required]
        public string User { get; set; }

        [Required]
        public string Room { get; set; }
    }
}
