/// @desc sudoku_create_solution()

inventory=ds_list_create();

for(var i=0;i<81;i++) {
	inventory[| i]=ds_list_create();
	ds_list_add(inventory[| i],1,2,3,4,5,6,7,8,9);
	ds_list_shuffle(inventory[| i]);
}

var square=0;
var step=0;
while(square<81) {
	//START
	step++;
	if(step>2815) { //Safety net (at 4th STD DEV)
		for(var i=0;i<81;i++) {
			ds_list_clear(inventory[| i]);
			ds_list_add(inventory[| i],1,2,3,4,5,6,7,8,9);
			ds_list_shuffle(inventory[| i]);
		}
		square=0;
		step=0;
		continue;
	}
	//Get a number randomly from the available numbers
	solution[square]=ds_list_find_value(inventory[| square],0);
	//Are we out of Numbers?
	if(is_undefined(solution[square])) {
		//Replenish this squares numbers and go back 1 square
		ds_list_add(inventory[| square],1,2,3,4,5,6,7,8,9);
		ds_list_shuffle(inventory[| square]);
		square--;
		continue;
	}
	//Use it!
	ds_list_delete(inventory[| square],0);
	//Does it Conflict?
	if(sudoku_create_solution_check_conflict(solution,square)) {
		//Remove from available numbers for this square
		continue;
	}
	square++;
}

for(var i=0;i<81;i++) {
	ds_list_destroy(inventory[| i]);
}
ds_list_destroy(inventory);