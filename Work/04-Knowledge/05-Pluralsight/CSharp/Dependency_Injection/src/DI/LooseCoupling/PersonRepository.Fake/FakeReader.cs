using People.Common;
using System;
using System.Collections.Generic;

namespace PersonRepository.Fake
{
    public class FakeReader : IPersonReader
    {
        public IEnumerable<Person> GetPeople()
        {
            return new List<Person>()
            {
                new Person() {FirstName = "John", LastName = "Smith",
                    Rating = 7, StartDate = new DateTime(2000, 10, 1)},
                new Person() {FirstName = "Mary", LastName = "Thomas",
                    Rating = 9, StartDate = new DateTime(1971, 7, 23)},
            };
        }

        public Person GetPerson(string lastName)
        {
            throw new NotImplementedException();
        }
    }
}
