using Autofac;
using Autofac.Features.ResolveAnything;
using PeopleViewer.Common;
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

        private void ConfigureContainer()
        {
            var builder = new ContainerBuilder();
            builder.RegisterType<ServiceReader>().As<IPersonReader>().SingleInstance();
            //builder.RegisterSource(new AnyConcreteTypeNotAlreadyRegisteredSource());
            builder.RegisterType<PeopleViewerWindow>().InstancePerDependency();
            builder.RegisterType<PeopleViewModel>().InstancePerDependency();

            Container = builder.Build();
        }

        private void ComposeObjectsWithContainer()
        {
            Application.Current.MainWindow = Container.Resolve<PeopleViewerWindow>();
        }
    }
}
