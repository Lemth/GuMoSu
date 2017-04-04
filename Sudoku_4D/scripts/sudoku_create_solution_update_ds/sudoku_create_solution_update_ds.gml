/// @desc sudoku_create_solution_update_ds()

//UPDATE DATASTRUCTURES
inventory=ds_list_create(); //inventory of values for each square
library=ds_list_create(); //library of values to replenish inventory with for each square
for(var i=16;i<96;i++) { //starting at 17th (i=16) square (all previous are init with 0)
	inventory[| i]=ds_list_create();
	library[| i]=ds_list_create();
	ds_list_copy(library[| i],_values);
	for(var j=0;j<16;j++) { //remove assigned numbers from library of each square
		if(_value_x[i]==_value_x[j] || _value_y[i]==_value_y[j] || _value_z[i]==_value_z[j]) {
			ds_list_delete_value(library[| i],solution[j]);
		}
	}
	ds_list_shuffle(library[| i]); //create randomization
    ds_list_copy(inventory[| i],library[| i]); //replenish inventory from (reduced) library
}
