using System.Linq;
using Avalonia;
using SudokuApp.Styles.Themes;

namespace SudokuApp.ViewModels
{
	public class MainViewModel : ViewModelBase
	{
		public void SwitchThemeCommand()
		{
			if (Application.Current== null)
			{
				return;
			}

			var mergedDictionaries = Application.Current.Resources.MergedDictionaries;
			var customTheme = mergedDictionaries.FirstOrDefault(d => d is ICustomTheme);
			if (customTheme == null) return;
			mergedDictionaries.Clear();
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