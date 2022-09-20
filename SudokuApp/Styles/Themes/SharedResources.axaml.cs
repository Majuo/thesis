using Avalonia.Controls;
using Avalonia.Markup.Xaml;

namespace SudokuApp.Styles.Themes;

public class SharedResources: ResourceDictionary
{
	public SharedResources() => AvaloniaXamlLoader.Load(this);
}