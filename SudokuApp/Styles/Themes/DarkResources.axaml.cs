using Avalonia.Controls;
using Avalonia.Markup.Xaml;

namespace SudokuApp.Styles.Themes;

public partial class DarkResources : ResourceDictionary, ISwitchableTheme
{
	public DarkResources() => AvaloniaXamlLoader.Load(this);
}