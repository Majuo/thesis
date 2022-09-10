using SudokuApp.Model;

namespace SudokuApp.ViewModels
{
    public class MainViewModel : ViewModelBase
    {
        public string Greeting => "Welcome to SudokuApp!";
        public Sudoku Sudoku { get; set; }

        public MainViewModel()
        {
            Sudoku = new Sudoku();
        }
    }
}
