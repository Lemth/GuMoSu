/// @desc sudoku()

yt_create_Puzzle();

yt_setup_Puzzle();

// https://www.youtube.com/watch?v=oUtxBYHrHFY 1:18
while(unsolved>0) {
  progress=yt_check_Puzzle();
  if(progress==0) {
    display_debug_message("Failed to solve the Puzzle!");
    break; 
  }
}
// https://www.youtube.com/watch?v=Nc7eCcTkzxg final


//CLEANUP CREW
//loop through rows
for(var j=0;j<9;j++) {
  //loop through columns
  for(var i=0;i<9;i++) {
    ds_list_destroy(ds_map_find_value(sudoku_grid[# i,j],"possible"));
    ds_map_destroy(sudoku_grid[# i,j]);
  }	
  ds_list_destroy(ds_map_find_value(sudoku_box[| j],"possible"));
  ds_list_destroy(ds_map_find_value(sudoku_box[| j],"squares"));
  ds_map_destroy(sudoku_box[| j]);
}
ds_grid_destroy(sudoku_grid);
ds_list_destroy(sudoku_box);

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
