/// @desc sudoku_create_solution_update_ds()

//UPDATE DATASTRUCTURES
for(var i=64;i<96;i++) { //starting at 65th (i=64) square for updating
	for(var j=16;j<48;j++) { //remove assigned numbers from library of each square UNTIL SAFE VALUE
		//if(_value_x[i]==_value_x[j] || _value_y[i]==_value_y[j] || _value_z[i]==_value_z[j]) {
		if(_matrix_position[i]&_matrix_position[j]>0) {
			ds_list_delete_value(library[| i],solution[j]);
		}
	}
	ds_list_shuffle(library[| i]); //create randomization
    ds_list_copy(inventory[| i],library[| i]); //update inventory from (further reduced) library
}
