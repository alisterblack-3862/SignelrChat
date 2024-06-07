using System.ComponentModel.DataAnnotations;

namespace Signalrchat.Models
{
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
