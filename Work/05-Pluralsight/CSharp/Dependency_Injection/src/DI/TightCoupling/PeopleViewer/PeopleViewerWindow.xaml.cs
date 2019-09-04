using PeopleViewer.Presentation;
using System.Windows;

namespace PeopleViewer
{
    public partial class PeopleViewerWindow : Window
    {
        public PeopleViewerWindow()
        {
            InitializeComponent();

            DataContext = new PeopleViewModel();
        }
    }
}



