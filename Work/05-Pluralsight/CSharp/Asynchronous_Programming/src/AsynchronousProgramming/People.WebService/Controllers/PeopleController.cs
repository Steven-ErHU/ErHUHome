using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using PeopleApi.Models;
using System;

namespace PeopleApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PeopleController : ControllerBase
    {
        private readonly PeopleContext _context;

        public PeopleController(PeopleContext context)
        {
            _context = context;

            if (_context.PeopleItems.Count() == 0)
            {
                // Create a new TodoItem if collection is empty,
                // which means you can't delete all TodoItems.
                 _context.PeopleItems.Add(new PeopleService() { FirstName="John", LastName="Koenig", StartDate = new DateTime(1975, 10, 17), Rating=6 });
                 _context.PeopleItems.Add(new PeopleService() { FirstName="Dylan", LastName="Hunt",StartDate = new DateTime(2000, 10, 2), Rating=8 });
                 _context.PeopleItems.Add(new PeopleService() { FirstName="Dylan", LastName="Hunt",StartDate = new DateTime(2000, 10, 2), Rating=8 });
                 _context.PeopleItems.Add(new PeopleService() { FirstName="John", LastName="Crichton",StartDate = new DateTime(1999, 3, 19), Rating=7 });
                 _context.PeopleItems.Add(new PeopleService() { FirstName="Dave", LastName="Lister",StartDate = new DateTime(1988, 2, 15), Rating=9 });
                 _context.PeopleItems.Add(new PeopleService() { FirstName="John", LastName="Sheridan",StartDate = new DateTime(1994, 1, 26), Rating=6 });
                 _context.PeopleItems.Add(new PeopleService() { FirstName="Dante", LastName="Montana",StartDate = new DateTime(2000, 11, 1), Rating=5 });
                 _context.PeopleItems.Add(new PeopleService() { FirstName="Isaac", LastName="Gampu",StartDate = new DateTime(1977, 9, 10), Rating=4 });

                _context.SaveChanges();

            }
        }

        // GET: api/Todo
        [HttpGet]
        public async Task<ActionResult<IEnumerable<PeopleService>>> GetTodoItems()
        {
            await Task.Delay(5000);//delay for test purpose
            return await _context.PeopleItems.ToListAsync();
        }

        // GET: api/Todo/5
        [HttpGet("{id}")]
        public async Task<ActionResult<PeopleService>> GetTodoItem(long id)
        {
            var todoItem = await _context.PeopleItems.FindAsync(id);

            if (todoItem == null)
            {
                return NotFound();
            }

            return todoItem;
        }
    }
}