using System;
using System.Collections.Generic;

namespace High_Webbanquanao.Data
{
    public partial class User
    {
        public User()
        {
            Carts = new HashSet<Cart>();
        }

        public string UserId { get; set; } = null!;
        public string Username { get; set; } = null!;
        public string Password { get; set; } = null!;
        public string Email { get; set; } = null!;
        public string? FullName { get; set; }
        public string? Address { get; set; }
        public string? PhoneNumber { get; set; }
        public string? UserType { get; set; }
        public int NumericId { get; set; }
        public string? ComputedUserId { get; set; }

        public virtual ICollection<Cart> Carts { get; set; }
    }
}
