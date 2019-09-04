using Microsoft.EntityFrameworkCore;

namespace PeopleApi.Models
{
    public class PeopleContext : DbContext
    {
        public PeopleContext(DbContextOptions<PeopleContext> options)
            : base(options)
        {
        }

        public DbSet<PeopleService> PeopleItems { get; set; }
    }
}