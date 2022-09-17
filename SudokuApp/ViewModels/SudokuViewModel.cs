using SudokuApp.Model;

namespace SudokuApp.ViewModels;

public class SudokuViewModel : ViewModelBase
{
	public string Greeting => "Welcome to SudokuApp!";
	public Sudoku Sudoku { get; set; }
	public SudokuCell SelectedCell { get; set; }

	public SudokuViewModel()
	{
		Sudoku = new Sudoku();
	}
}
	