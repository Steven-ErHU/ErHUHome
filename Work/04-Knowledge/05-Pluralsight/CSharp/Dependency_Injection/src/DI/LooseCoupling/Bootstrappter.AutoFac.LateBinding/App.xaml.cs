using Autofac;
using Autofac.Configuration;
using Autofac.Features.ResolveAnything;
using Microsoft.Extensions.Configuration;
using PeopleViewer.Presentation;
using PeopleViewer.Views;
using PersonRepository.Caching;
using PersonRepository.CSV;
using PersonRepository.Service;
using System.Windows;

namespace Bootstrappter.AutoFac.LateBinding
{
    /// <summary>
    /// Interaction logic for App.xaml
    /// </summary>
    public partial class App : Application
    {
        IContainer Container;

        protected override void OnStartup(StartupEventArgs e)
        {
            base.OnStartup(e);

            ConfigureContainer();
            ComposeObjectsWithContainer();
            Application.Current.MainWindow.Show();
        }

        #region WithContainer

        private void ConfigureContainer()
        {
            var config = new ConfigurationBuilder();
            config.AddJsonFile("autofac.json");

            var module = new ConfigurationModule(config.Build());
            var builder = new ContainerBuilder();
            builder.RegisterModule(module);

            builder.RegisterSource(new AnyConcreteTypeNotAlreadyRegisteredSource());

            Container = builder.Build();
        }

        private void ComposeObjectsWithContainer()
        {
            Application.Current.MainWindow = Container.Resolve<PeopleViewerWindow>();
        }

        #endregion
    }
}
