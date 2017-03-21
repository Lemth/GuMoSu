
sudoku_grid=ds_grid_create(9,9);
sudoku_box=ds_list_create();

//loop through rows
for(var j=0;j<9;j++) {
	//loop through columns
	for(var i=0;i<9;i++) {
		sudoku_grid[# i,j] = ds_map_create();
		ds_map_add(sudoku_grid[# i,j],"number",puzzle[i,j]);
		ds_map_add(sudoku_grid[# i,j],"possible",ds_list_create());
		ds_list_add(ds_map_find_value(sudoku_grid[# i,j],"possible"),0,0,0,0,0,0,0,0,0);
		ds_map_add(sudoku_grid[# i,j],"solvable",9);
		ds_map_add(sudoku_grid[# i,j],"row",j);
		ds_map_add(sudoku_grid[# i,j],"column",i);
		ds_map_add(sudoku_grid[# i,j],"box",-1);
	}	
}
for(var k=0;k<9;k++) {
	sudoku_box[| k] = ds_map_create();
	ds_map_add(sudoku_box[| k],"numbers",0);
	ds_map_add(sudoku_box[| k],"possible",ds_list_create());
	ds_list_add(ds_map_find_value(sudoku_box[| k],"possible"),0,0,0,0,0,0,0,0,0);
	ds_map_add(sudoku_box[| k],"solvable",9);
	ds_map_add(sudoku_box[| k],"squares",ds_list_create());
	//loop through rows
	for(var j=0;j<9;j++) {
		//loop through columns
		for(var i=0;i<9;i++) {
			if(floor(i/3)+3*floor(j/3)==k) {
				ds_list_add(ds_map_find_value(sudoku_box[| k],"squares"),sudoku_grid[# i,j]);
				ds_map_replace(sudoku_box[| k],"numbers",ds_map_find_value(sudoku_box[| k],"numbers")+1);
				ds_map_replace(sudoku_grid[# i,j],"box",sudoku_box[| k]);
			}
		}
	}
}

//loop through rows
for(var j=0;j<9;j++) {
	//loop through columns
	for(var i=0;i<9;i++) {
		if(ds_map_find_value(sudoku_grid[# i,j],"number")!=0) {
			ds_map_replace(sudoku_grid[# i,j],"solvable",0);
			yt_update_Sudoku(sudoku_grid,i,j);
			yt_update_Boxes(sudoku_grid,i,j);
			unsolved--;
		}
	}
}

return true;