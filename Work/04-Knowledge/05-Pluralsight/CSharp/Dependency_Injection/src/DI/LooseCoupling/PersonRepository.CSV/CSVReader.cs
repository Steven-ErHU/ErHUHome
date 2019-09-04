using People.Common;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;

namespace PersonRepository.CSV
{
    public class CSVReader : IPersonReader
    {
        string _csvFilename;

        public CSVReader()
        {
            _csvFilename = AppDomain.CurrentDomain.BaseDirectory + "Resources\\People.csv";
        }

        public IEnumerable<Person> GetPeople()
        {
            var people = new List<Person>();

            if (File.Exists(_csvFilename))
            {
                using (var sr = new StreamReader(_csvFilename))
                {
                    string line;
                    while ((line = sr.ReadLine()) != null)
                    {
                        var elems = line.Split(',');
                        var per = new Person()
                        {
                            FirstName = elems[0],
                            LastName = elems[1],
                            StartDate = DateTime.Parse(elems[2]),
                            Rating = Int32.Parse(elems[3])
                        };
                        people.Add(per);
                    }
                }
            }
            return people;
        }

        public Person GetPerson(string lastName)
        {
            Person selPerson = new Person();
            if (File.Exists(_csvFilename))
            {
                var sr = new StreamReader(_csvFilename);
                string line;
                while ((line = sr.ReadLine()) != null)
                {
                    var elems = line.Split(',');
                    if (elems[1].ToLower() == lastName.ToLower())
                    {
                        selPerson.FirstName = elems[0];
                        selPerson.LastName = elems[1];
                        selPerson.StartDate = DateTime.Parse(elems[2]);
                        selPerson.Rating = Int32.Parse(elems[3]);
                    }
                }
            }

            return selPerson;
        }

    }
}
