using Avalonia.Controls;
using Avalonia.Markup.Xaml;

namespace SudokuApp.Views;

public partial class SudokuView : UserControl
{
	public SudokuView()
	{
		InitializeComponent();
	}

	private void InitializeComponent()
	{
		AvaloniaXamlLoader.Load(this);
	}
}