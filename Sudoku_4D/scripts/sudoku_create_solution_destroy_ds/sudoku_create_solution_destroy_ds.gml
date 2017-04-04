/// @desc sudoku_create_solution_destroy_ds()

//CLEANUP DATASTRUCTURES
for(var i=16;i<96;i++) { //starting at 17th (i=16) square (all previous are init with 0)
    ds_list_destroy(inventory[| i]);
	ds_list_destroy(library[| i]);
}
ds_list_destroy(inventory);
ds_list_destroy(library);
