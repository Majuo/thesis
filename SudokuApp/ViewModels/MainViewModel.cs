using System.Linq;
using Avalonia;
using SudokuApp.Styles.Themes;

namespace SudokuApp.ViewModels
{
	public class MainViewModel : ViewModelBase
	{
		public SudokuViewModel SudokuViewModel { get; set; }
		public MainViewModel()
		{
			SudokuViewModel = new SudokuViewModel();
		}
		public void SwitchThemeCommand()
		{
			if (Application.Current== null)
			{
				return;
			}

			var mergedDictionaries = Application.Current.Resources.MergedDictionaries;
			var customTheme = mergedDictionaries.FirstOrDefault(d => d is ISwitchableTheme);
			if (customTheme == null) return;
			mergedDictionaries.Remove(customTheme);
			// TODO: remake. Take theme as an argument and just set it without if-else
			if (customTheme is DarkResources)
			{
				mergedDictionaries.Add(new LightResources());
			}
			else
			{
				mergedDictionaries.Add(new DarkResources());
			}
		}
	}
}