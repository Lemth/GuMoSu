/// @desc sudoku_create_solution_create_ds()

//INIT ARRAYS
ds_list_shuffle(_values); //1,2,3,..,16
for(var i=0;i<96;i++) {
	solution[_order_s[i]]=i<16 ? _values[| i] : 0; //ternary op; <expression> ? <expression is true> : <expression is false>
	//puzzle[i]=0;
} 

//CREATE DATASTRUCTURES
inventory=ds_list_create(); //inventory of values for each square
library=ds_list_create(); //library of values to replenish inventory with for each square
for(var i=16;i<96;i++) { //starting at 17th (i=16) square (all previous are init with 0)
	inventory[| _order_s[i]]=ds_list_create();
	library[| _order_s[i]]=ds_list_create();
	ds_list_copy(library[| _order_s[i]],_values);
	for(var j=0;j<16;j++) { //remove assigned numbers from library of each square
		if(_value_x[_order_s[i]]==_value_x[_order_s[j]] || _value_y[_order_s[i]]==_value_y[_order_s[j]] || _value_z[_order_s[i]]==_value_z[_order_s[j]]) {
			ds_list_delete_value(library[| _order_s[i]],solution[_order_s[j]]);
		}
	}
	ds_list_shuffle(library[| _order_s[i]]); //create randomization
    ds_list_copy(inventory[| _order_s[i]],library[| _order_s[i]]); //replenish inventory from (reduced) library
}

//INIT VAR
//step=0;
square=16;
