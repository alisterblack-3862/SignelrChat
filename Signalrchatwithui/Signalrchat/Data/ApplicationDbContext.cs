using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;

namespace MessageApp.Data
{
    public partial class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
            : base(options)
        {
        }

        public DbSet<Message> Messages { get; set; }
        public DbSet<Student> Students { get; set; }
        public DbSet<ChatRooms> ChatRoom { get; set; }
    }
    public class ChatRooms
    {
        [Key]
        public int RoomId { get; set; }
        public string User1 { get; set; }
        public string User2 { get; set; }
        public string CommonRoom { get; set; }
        public string CreatedDate { get; set; }
    }
    public class Message
    {
        public int Id { get; set; }
        public string User { get; set; }
        public string Text { get; set; }
        public DateTime Timestamp { get; set; }
    }
    public class Student
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Email { get; set; }
        public string Mobile { get; set; }
        public string Password { get; set; }
        public string Image { get; set; }
    }

}