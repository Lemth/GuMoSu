/// @desc sudoku_create_puzzle()

inventory=ds_list_create();
var _order=ds_list_create();
for(var i=0;i<96;i++) {
	inventory[| i]=ds_list_create();
	ds_list_add(inventory[| i],solution[i]); // DO I NEED 1,2,3..16 ?? OR JUST 0 ??
    ds_list_add(_order,i);
}
ds_list_shuffle(_order);

for(ds_list_size(r_order)>0) { //work through all squares once
	var i=ds_list_find_value(_order,0); //get random square
	ds_list_delete_index(_order,0); //prevent duplicate squares
	
    ds_list_copy(inventory[| i],_value); //try all values...
	ds_list_value_delete(inventory[| i],solution[i]) //...except solution value
		
	//SOLVER
    if(sudoku_create_puzzle_solver()) { //if solvable then can't remove this square:
		ds_list_clear(inventory[| i]); //restore square
		ds_list_add(inventory[| i],solution[i]);
	} else {
		ds_list_add(inventory[| i],solution[i]); //else, complete square
	}
}

for(var i=0;i<96;i++) {
	ds_list_destroy(inventory[| i]);
}
ds_list_destroy(inventory);
ds_list_destroy(_order);



/// @desc sudoku_create_puzzle_solver()

