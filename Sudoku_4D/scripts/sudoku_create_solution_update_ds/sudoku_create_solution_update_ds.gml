/// @desc sudoku_create_solution_update_ds(value)

//UPDATE DATASTRUCTURES
for(var i=24;i<96;i++) { //starting at 65th (i=64) square for updating
	if(i==32) { i=40; }
	for(var j=16;j<24;j++) { //remove assigned numbers from library of each square UNTIL SAFE VALUE
		if(_value_x[i]==_value_x[j] || _value_y[i]==_value_y[j] || _value_z[i]==_value_z[j]) {
			ds_list_delete_value(library[| i],solution[j]);
		}
	}
	for(var j=32;j<40;j++) { //remove assigned numbers from library of each square UNTIL SAFE VALUE
		if(_value_x[i]==_value_x[j] || _value_y[i]==_value_y[j] || _value_z[i]==_value_z[j]) {
			ds_list_delete_value(library[| i],solution[j]);
		}
	}
	ds_list_shuffle(library[| i]); //create randomization
    ds_list_copy(inventory[| i],library[| i]); //update inventory from (further reduced) library
}
