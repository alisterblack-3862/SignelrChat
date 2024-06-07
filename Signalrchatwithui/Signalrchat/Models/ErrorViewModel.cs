namespace Signalrchat.Models
{
    public class ErrorViewModel
    {
        public string? RequestId { get; set; }

        public bool ShowRequestId => !string.IsNullOrEmpty(RequestId);
    }
        public class LoginModel
    {
        public string UserName { get; set; }
        public string Password { get; set; }
    }
}
