/// @desc scr_sudoku_puzzle_brute(list)
/// @arg list argument0
var smallest=0;
for(var i=0;i<96;i++) { // BRUTE FORCE
	if(ds_list_size(inventory[| i])==2) {
		smallest=i;
		break;
	} else if(ds_list_size(inventory[| i]>2)) {
		if(ds_list_size(inventory[| i]<ds_list_size(inventory[| smallest]))) {
			smallest=i;	
		}
	}
}
var hold_list=ds_list_create();
ds_list_copy(hold_list,inventory[| smallest]);
ds_list_clear(inventory[| smallest]);
ds_list_add(inventory[| smallest],hold_list[| 0]);
//if(sudoku_create_puzzle_solver(inventory)) { //if solvable
	//ds_list_destroy_nested(inventory);
	return true; //solvable even in this configuration; not a unique puzzle
//}
ds_list_delete(hold_list,0);
ds_list_copy(inventory[| smallest],hold_list);
ds_list_destroy(hold_list);
if(ds_list_size(inventory[| smallest])==1) {
	solved++;
	show_debug_message("BRUTE: "+string(solved));
}
