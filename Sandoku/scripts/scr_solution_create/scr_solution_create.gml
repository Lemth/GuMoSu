/// @desc scr_solution_create()
time=get_timer();
step=0;
scr_solution_restart();
var maxsquare=0;

//START
while(square<96) { 
	if(square>maxsquare) { //////////16 t/m 24 @ 32^ 
		if(square==32 || square==48) {
			scr_solution_update(square); //////////32 t/m 40 @ 48^ 
		}
	}
	maxsquare=max(maxsquare,square);
	
    step++;
    if((step mod 20000)==0 || square<16) { //Safety net (at median / 20.000)
		if(step>=1000000 || square<0) {
			exit;
		}
		scr_solution_restart();
		maxsquare=0;
        continue;
    }
	
    solution[square]=ds_list_find_value(inventory[| square],0); //Get a number randomly from the available numbers
    if(is_undefined(solution[square])) { //Are we out of Numbers?
        ds_list_copy(inventory[| square],library[| square]); //Replenish inventory from (reduced) library
        square--; //and go back 1 square
        continue;
    }
    ds_list_delete(inventory[| square],0); //Use it!
    if(scr_solution_check_constraints(square)) { //Does it Conflict?
        continue; //Remove from available numbers for this square
    }
    square++;
} 

valid=scr_solution_validate();

time=get_timer()-time;