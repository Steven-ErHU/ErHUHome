using Common;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Net;

namespace PersonRepository.Service
{
    public class ServiceReader
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
                Log(err);
                return new List<Person>() { new Person() { FirstName = "No Data Available", LastName = string.Empty, Rating = 0, StartDate = DateTime.Today } };
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

        private void Log(Exception err)
        {
            //TODO
        }
    }
}


