using Avalonia;
using Avalonia.Controls.ApplicationLifetimes;
using Avalonia.Markup.Xaml;
using Avalonia.Themes.Fluent;
using SudokuApp.Styles.Themes;
using SudokuApp.ViewModels;
using SudokuApp.Views;

namespace SudokuApp
{
	public partial class App : Application
	{
		public override void Initialize()
		{
			AvaloniaXamlLoader.Load(this);
			LoadTheme();
		}

		public override void OnFrameworkInitializationCompleted()
		{
			if (ApplicationLifetime is IClassicDesktopStyleApplicationLifetime desktop)
			{
				desktop.MainWindow = new MainWindow
				{
					DataContext = new MainViewModel()
				};
			}
			else if (ApplicationLifetime is ISingleViewApplicationLifetime singleViewPlatform)
			{
				singleViewPlatform.MainView = new MainView
				{
					DataContext = new MainViewModel()
				};
			}

			base.OnFrameworkInitializationCompleted();
		}

		private void LoadTheme()
		{
			Current!.Resources.MergedDictionaries.Add(new DarkResources());
		}
	}
}