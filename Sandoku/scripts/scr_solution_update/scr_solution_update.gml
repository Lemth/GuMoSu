/// @desc scr_solution_update(value)
/// @arg value argument0

//UPDATE DATASTRUCTURES
for(var i=argument0;i<96;i++) { //starting at 65th (i=64) square for updating
	for(var j=argument0-16;j<argument0-8;j++) { //remove assigned numbers from library of each square UNTIL SAFE VALUE
		if(scr_square_is_peer(i,j)) {
			ds_list_delete_value(library[| i],solution[j]);
		}
	}
	ds_list_shuffle(library[| i]); //create randomization
    ds_list_copy(inventory[| i],library[| i]); //update inventory from (further reduced) library
}

