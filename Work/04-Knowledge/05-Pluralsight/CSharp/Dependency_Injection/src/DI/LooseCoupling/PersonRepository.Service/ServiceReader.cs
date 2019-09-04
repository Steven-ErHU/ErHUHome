using Newtonsoft.Json;
using People.Common;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace PersonRepository.Service
{
    public class ServiceReader : IPersonReader
    {
        public IEnumerable<Person> GetPeople()
        {
            WebClient client = new WebClient();
            var baseUrl = "http://localhost:5001/api/people/";

            try
            {
                var result = client.DownloadString(baseUrl);
                return DeserializeObject(result);
            }
            catch (Exception err)
            {
                return new List<Person>() { new Person() { FirstName = "No Data Available", LastName = string.Empty, Rating = 0, StartDate = DateTime.Today } };
                throw;
            }
            
        }

        private IEnumerable<Person> DeserializeObject(string result)
        {
            return JsonConvert.DeserializeObject<IEnumerable<Person>>(result);
        }

        public Person GetPerson(string lastName)
        {
            throw new NotImplementedException();
        }


    }
}
