/// @desc solver(list)
/// @arg list	argument0



var solver_inventory=ds_list_create();

for(var i=0;i<81;i++) {
	solver_inventory[| i]=ds_list_create();
	ds_list_copy(solver_inventory[| i],argument0[| i]);
}

http://norvig.com/sudoku.html



for(var i=0;i<81;i++) {
	if(ds_list_size(solver_inventory[| i])!=1) {
		show_debug_message(string(ds_list_size(solver_inventory[| i])));
		solved=false;
	}
	ds_list_destroy(solver_inventory[| i]);
}

ds_list_destroy(solver_inventory);

return solved;