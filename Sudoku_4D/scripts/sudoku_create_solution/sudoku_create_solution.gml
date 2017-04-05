/// @desc sudoku_create_solution()
step=0;
var maxsquare=0;

//START
while(square<96) { 
	if(square>maxsquare) {
		if(square==40 || square==56 || square==72) {
			sudoku_create_solution_update_ds(square);
		}
	}
	maxsquare=max(maxsquare,square);
	
    step++;
    if((step mod 30000)==0 || square<16) { //Safety net (at median / 200.000)
		if(step>=1000000 || square<0) {
			exit;
		}
		sudoku_create_solution_destroy_ds();
		sudoku_create_solution_create_ds();
		test=0;
        continue;
    }
	
    solution[square]=ds_list_find_value(inventory[| square],0); //Get a number randomly from the available numbers
    if(is_undefined(solution[square])) { //Are we out of Numbers?
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
