using System;
using System.Collections.Generic;
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
    }
}