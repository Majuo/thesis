class SudokuCell {
	SudokuCell(this.row, this.col, this.editable, this.value);

	int row = 0;
	int col = 0;
	bool editable = false;
	int value = 0;
	List<int> candidates = List.empty(growable: true);
}