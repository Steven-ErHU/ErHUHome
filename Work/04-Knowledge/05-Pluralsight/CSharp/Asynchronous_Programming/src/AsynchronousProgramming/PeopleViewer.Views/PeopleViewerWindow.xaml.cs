using People.Presentation;
using System.Windows;

namespace PeopleViewer.Views
{
    public partial class PeopleViewerWindow : Window
    {
        public PeopleViewerWindow(PeopleViewModel viewModel)
        {
            InitializeComponent();
            DataContext = viewModel;
        }
    }
}
