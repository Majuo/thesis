﻿using System;
using System.Collections.Generic;

namespace SudokuApp.Model
{
	public class Sudoku
	{
		public Sudoku()
		{
			CreateCells();
		}

		public List<SudokuCell> Cells { get; set; }

		public void CreateCells()
		{
			Cells = new List<SudokuCell>();

			var random = new Random();

			for (int n = 0; n < 81; n++)
			{
				Cells.Add(new SudokuCell() { Solution = (random.Next(9) + 1) });
			}
		}
	}
}