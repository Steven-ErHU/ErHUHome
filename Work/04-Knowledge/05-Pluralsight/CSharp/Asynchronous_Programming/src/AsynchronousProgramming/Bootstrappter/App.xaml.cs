using People.Presentation;
using PeopleViewer.Views;
using PersonRepository.Service;
using System.Windows;

namespace Bootstrappter
{
    /// <summary>
    /// Interaction logic for App.xaml
    /// </summary>
    public partial class App : Application
    {
        protected override void OnStartup(StartupEventArgs e)
        {
            base.OnStartup(e);

            ComposeObjects();
            Application.Current.MainWindow.Show();
        }

        private static void ComposeObjects()
        {
            var wrappedRepository = new ServiceReader();
            //var repository = new CachingReader(wrappedRepository);
            var viewModel = new PeopleViewModel(wrappedRepository);
            Application.Current.MainWindow = new PeopleViewerWindow(viewModel);
        }
    }
}
