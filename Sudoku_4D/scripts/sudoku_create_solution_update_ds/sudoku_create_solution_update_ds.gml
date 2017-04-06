/// @desc sudoku_create_solution_update_ds(value)
/// @arg value argument0

var v=argument0;

//UPDATE DATASTRUCTURES
for(var i=v;i<96;i++) { //starting at 65th (i=64) square for updating
	for(var j=v-24;j<v-8;j++) { //remove assigned numbers from library of each square UNTIL SAFE VALUE
		if(_value_x[_order_s[i]]==_value_x[_order_s[j]] || _value_y[_order_s[i]]==_value_y[_order_s[j]] || _value_z[_order_s[i]]==_value_z[_order_s[j]]) {
			ds_list_delete_value(library[| i],solution[_order_s[j]]);
		}
	}
	ds_list_shuffle(library[| i]); //create randomization
    ds_list_copy(inventory[| i],library[| i]); //update inventory from (further reduced) library
}
