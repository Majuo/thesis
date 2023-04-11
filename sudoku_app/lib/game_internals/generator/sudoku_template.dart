class SudokuTemplate {
  SudokuTemplate();
  List<List<String>> initState = List.empty(growable: true);
  List<List<String>> solution = List.empty(growable: true);
  Map<String, dynamic> toJson() => {
    'initState' : initState.map((r) => r.join()).join(),
    'solution' : solution.map((r) => r.join()).join()
  };

  SudokuTemplate.fromJson(Map<String,dynamic> json) {
    for (var i = 0; i < 9; i++) {
      initState.add(List.empty(growable: true));
      solution.add(List.empty(growable: true));
      for (var j = 0; j < 9; j++) {
        initState.elementAt(i).add("-");
        solution.elementAt(i).add("-");
      }
    }
    for (var i = 0; i < 9; i++) {
      for (var j = 0; j < 9; j++) {
        initState[i][j] = (json['initState'] as String)[i * 9 + j];
        solution[i][j] = (json['solution'] as String)[i * 9 + j];
      }
    }
  }
}