using System;
using System.Collections.Generic;

namespace SudokuApp.Model
{
	public class SudokuCell
	{
		public List<int> PencilMarks { get; set; } = new List<int>();
		public int Solution { get; set; }
		public bool SolutionEntered { get; set; } = true;
	}
}