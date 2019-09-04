using People.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PersonRepository.Caching
{
    public class CachingReader : IPersonReader
    {
        private TimeSpan _cacheDuration = new TimeSpan(0, 0, 15);
        private DateTime _dataDateTime;
        private IPersonReader _wrappedRepository;
        private IEnumerable<Person> _cachedItems;

        public CachingReader(IPersonReader wrappedPersonRepository)
        {
            _wrappedRepository = wrappedPersonRepository;
        }

        public IEnumerable<Person> GetPeople()
        {
            ValidateCache();
            return _cachedItems;
        }

        public Person GetPerson(string lastName)
        {
            ValidateCache();
            return _cachedItems.FirstOrDefault(p => p.LastName == lastName);
        }

        private bool IsCacheValid
        {
            get
            {
                var _cacheAge = DateTime.Now - _dataDateTime;
                return _cacheAge < _cacheDuration;
            }
        }

        private void ValidateCache()
        {
            if (_cachedItems == null || !IsCacheValid)
            {
                try
                {
                    _cachedItems = _wrappedRepository.GetPeople();
                    _dataDateTime = DateTime.Now;
                }
                catch
                {
                    _cachedItems = new List<Person>()
                    {
                        new Person(){ FirstName="No Data Available", LastName = string.Empty, Rating = 0, StartDate = DateTime.Today},
                    };
                }
            }
        }

        private void InvalidateCache()
        {
            _dataDateTime = DateTime.MinValue;
        }
    }
}
