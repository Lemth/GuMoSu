///@desc scr_puzzle_create()
var count=0;
time=get_timer();

var _order=ds_list_create();
for(var i=0;i<96;i++) {
	inventory[| i]=solution[i]==0 ? $FFFF : index_to_binary(solution[i]);
	ds_list_add(_order,i);
}
ds_list_shuffle(_order);
while(ds_list_size(_order)>0) { //work through all squares once
	var i=ds_list_find_value(_order,0); //get random square
	show_debug_message(string(round((96-ds_list_size(_order))/.96))+"%");
	ds_list_delete(_order,0); //prevent duplicate squares
	
    inventory[| i]=$FFFF;
	if(puzzle_create_mode==1) {
		if(!scr_sudoku_puzzle_solver(inventory)) { //if solvable then remove this square:
			inventory[| i]=index_to_binary(solution[i]); //restore square
		} else {
			inventory[| i]=$FFFF;
		}
	}
	inventory[| i]=$FFFF^index_to_binary(solution[i]); //try all values except known value (XOR)
	if (puzzle_create_mode==2) {
		if(scr_sudoku_puzzle_brute(inventory)) { //if solvable then can't remove this square:
			inventory[| i]=index_to_binary(solution[i]); //restore square
		} else {
			inventory[| i]=$FFFF;
		}
	}
}
ds_list_destroy(_order);

for(var i=0;i<96;i++) {
	if(inventory[| i]==$FFFF) {
		puzzle[i]=0;
	} else {
		puzzle[i]=binary_to_index(inventory[| i]);
		count++;
	}
} 

valid=scr_puzzle_validate();
time=get_timer()-time;

return count;