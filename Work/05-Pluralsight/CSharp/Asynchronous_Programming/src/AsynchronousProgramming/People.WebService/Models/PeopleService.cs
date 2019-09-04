namespace PeopleApi.Models
{
    public class PeopleService
    {
        public long Id { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public System.DateTime StartDate { get; set; }
        public int Rating { get; set; }
    }
}