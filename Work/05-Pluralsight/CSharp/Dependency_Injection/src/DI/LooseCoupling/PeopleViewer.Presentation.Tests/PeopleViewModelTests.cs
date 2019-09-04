using Microsoft.VisualStudio.TestTools.UnitTesting;
using PersonRepository.Fake;
using System.Linq;

namespace People.Presentation.Tests
{
    [TestClass]
    public class PeopleViewModelTests
    {
        [TestMethod]
        public void People_OnRefreshCommand_IsPopulated()
        {
            // Arrange
            var repository = new FakeReader();
            var vm = new PeopleViewModel(repository);

            // Act
            vm.RefreshPeopleCommand.Execute(null);

            // Assert
            Assert.IsNotNull(vm.People);
            Assert.AreEqual(2, vm.People.Count());
        }

        [TestMethod]
        public void People_OnClearCommand_IsEmpty()
        {
            // Arrange
            var repository = new FakeReader();
            var vm = new PeopleViewModel(repository);
            vm.RefreshPeopleCommand.Execute(null);
            Assert.AreEqual(2, vm.People.Count(), "Invalid Arrangement");

            // Act
            vm.ClearPeopleCommand.Execute(null);

            // Assert
            Assert.AreEqual(0, vm.People.Count());
        }
    }
}
