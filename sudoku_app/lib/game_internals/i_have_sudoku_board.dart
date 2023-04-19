import 'package:sudoku_app/game_internals/sudoku_cell.dart';

abstract class IHaveSudokuBoard {
  List<List<SudokuCell>> board = List.empty(growable: true);
}