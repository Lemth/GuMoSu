//loop through rows
for(var j=0;j<9;j++) {
	//loop through columns
	for(var i=0;i<9;i++) {
		if(ds_map_find_value(sudoku_grid[# i,j],"solvable")==1) {
			
			yt_solve_Square(sudoku_grid[# i,j]);
			yt_update_Sudoku(sudoku_grid,i,j);
			yt_update_Boxes(sudoku_grid,i,j);
			
			// https://www.youtube.com/watch?v=oUtxBYHrHFY 3:11
			return 1;
		}
	}
}

if(yt_box_Singles(sudoku_grid,sudoku_box)) {
	return 1;	
} 

if(yt_check_Rows(sudoku_grid,sudoku_box)) {
	return 1;
}
return yt_check_Columns(sudoku_grid,sudoku_box);

return 0;