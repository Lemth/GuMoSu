/// @desc sudoku_create_solution_update_ds(value)
/// @arg value argument0

//UPDATE DATASTRUCTURES
for(var i=argument0;i<96;i++) { //starting at 65th (i=64) square for updating
	for(var j=argument0-16;j<argument0-8;j++) { //remove assigned numbers from library of each square UNTIL SAFE VALUE
		if(_value_x[i]==_value_x[j] || _value_y[i]==_value_y[j] || _value_z[i]==_value_z[j]) {
			ds_list_delete_value(library[| i],solution[j]);
		}
	}
	ds_list_shuffle(library[| i]); //create randomization
    ds_list_copy(inventory[| i],library[| i]); //update inventory from (further reduced) library
}
