
//loop through rows
for(var j=0;j<9;j++) {
	//loop through columns
	for(var i=0;i<9;i++) {
		if(ds_map_find_value(sudoku_grid[# i,j],"solvable")==1) {
			
			yt_solve_Square(sudoku_grid[# i,j]);
			yt_update_Sudoku(sudoku_grid,i,j);
			yt_update_Boxes(sudoku_grid,i,j);
		}
	}
}

return true;