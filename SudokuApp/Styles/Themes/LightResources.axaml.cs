using Avalonia.Controls;
using Avalonia.Markup.Xaml;

namespace SudokuApp.Styles.Themes;

public class LightResources : ResourceDictionary, ISwitchableTheme
{
	public LightResources() => AvaloniaXamlLoader.Load(this);
}