/// @desc sudoku_create_solution()
step=0;
var test=0;

//START
while(square<96) { 
	test=max(test,square);
	if(square==64 && test==0) {
		sudoku_create_solution_update_ds()
	}
    step++;
    if((step mod 200000)==0 || square<16) { //Safety net (at median)
		sudoku_create_solution_destroy_ds();
		sudoku_create_solution_create_ds();
		test=0;
        continue;
    }
    solution[square]=ds_list_find_value(inventory[| square],0); //Get a number randomly from the available numbers
    if(is_undefined(solution[square])) { //Are we out of Numbers?
		puzzle[square]=max(puzzle[square],test); // update square to highest reached value - just a checker!
        ds_list_copy(inventory[| square],library[| square]); //Replenish inventory from (reduced) library
        square--; //and go back 1 square
        continue;
    }
    ds_list_delete(inventory[| square],0); //Use it!
    if(sudoku_create_solution_check_conflict(square)) { //Does it Conflict?
        continue; //Remove from available numbers for this square
    }
    square++;
} 
