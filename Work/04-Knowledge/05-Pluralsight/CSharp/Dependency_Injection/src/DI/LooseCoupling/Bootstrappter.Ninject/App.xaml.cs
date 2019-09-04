using PersonRepository.Caching;
using PersonRepository.CSV;
using PersonRepository.Service;
using System.Windows;
using Ninject;
using PeopleViewer.Views;
using People.Common;

namespace Bootstrappter.Ninject
{
    public partial class App : Application
    {
        IKernel Container;
        bool IsCacheEnabled = false;

        protected override void OnStartup(StartupEventArgs e)
        {
            base.OnStartup(e);

            ConfigureContainer();
            ComposeObjects();

            Application.Current.MainWindow.Show();
        }

        private void ConfigureContainer()
        {
            Container = new StandardKernel();

            if (IsCacheEnabled)
            {
                Container.Bind<IPersonReader>().To<CachingReader>().InSingletonScope()
                    .WithConstructorArgument<IPersonReader>(Container.Get<CSVReader>());
            }
            else
            {
                Container.Bind<IPersonReader>().To<CSVReader>().InSingletonScope();
            }
        }

        private void ComposeObjects()
        {
            Application.Current.MainWindow = Container.Get<PeopleViewerWindow>();
        }
    }
}
