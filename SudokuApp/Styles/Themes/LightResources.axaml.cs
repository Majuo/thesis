using Avalonia.Controls;
using Avalonia.Markup.Xaml;

namespace SudokuApp.Styles.Themes;

public class LightResources : ResourceDictionary, ICustomTheme
{
	public LightResources() => AvaloniaXamlLoader.Load(this);
}