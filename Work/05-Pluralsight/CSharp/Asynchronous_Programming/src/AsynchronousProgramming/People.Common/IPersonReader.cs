using System.Collections.Generic;
using System.Threading.Tasks;

namespace People.Common
{
    public interface IPersonReader
    {
        void GetPeople();

        Person GetPerson(string lastName);
    }
}
