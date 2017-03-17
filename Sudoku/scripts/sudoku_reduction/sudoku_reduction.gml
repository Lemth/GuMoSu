/// @desc sudoku_reduction()

puzzle[0]=0;
array_copy(puzzle,0,solution,0,81);

repeat(10) {
	var rand=irandom(80);
	puzzle[rand]=0;
}
sudoku_solver(puzzle);

