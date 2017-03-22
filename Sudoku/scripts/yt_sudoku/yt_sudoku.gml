/// @desc sudoku()

yt_create_Puzzle();

yt_setup_Puzzle();

// https://www.youtube.com/watch?v=oUtxBYHrHFY 1:18
while(unsolved>0) {
  progress=yt_check_Puzzle();
  if(progress==0) {
    show_debug_message("Failed to solve the Puzzle!");
    break; 
  }
}
// https://www.youtube.com/watch?v=Nc7eCcTkzxg final


//CLEANUP CREW
//loop through rows
for(var j=0;j<9;j++) {
  //loop through columns
  for(var i=0;i<9;i++) {
    puzzle[j*9+i]=ds_map_find_value(sudoku_grid[# i,j],"number");
    ds_list_destroy(ds_map_find_value(sudoku_grid[# i,j],"possible"));
    ds_map_destroy(sudoku_grid[# i,j]);
  }	
  ds_list_destroy(ds_map_find_value(sudoku_box[| j],"possible"));
  ds_list_destroy(ds_map_find_value(sudoku_box[| j],"squares"));
  ds_map_destroy(sudoku_box[| j]);
}
ds_grid_destroy(sudoku_grid);
ds_list_destroy(sudoku_box);

