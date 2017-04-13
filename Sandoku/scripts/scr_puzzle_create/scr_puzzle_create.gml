///@desc scr_puzzle_create()
var _order=ds_list_create();
for(var i=0;i<96;i++) {
	inventory[| i]=solution[i]==0 ? $FFFF : power(2,solution[i]-1);
	ds_list_add(_order,i);
}
if(ds_list_size(_order)>0) { //work through all squares once
	var i=ds_list_find_value(_order,0); //get random square
	ds_list_delete(_order,0); //prevent duplicate squares
	
    inventory[| i]=$FFFF^power(2,solution[i]-1); //try all values except known value (XOR)
	if(puzzle_create_mode==1) {
//		if(scr_sudoku_puzzle_solver(inventory)) { //if solvable then can't remove this square:
			inventory[| i]=solution[i]==0 ? $FFFF : power(2,solution[i]-1); //restore square
//		}
	} else if (puzzle_create_mode==2) {
		if(scr_sudoku_puzzle_brute(inventory)) { //if solvable then can't remove this square:
			inventory[| i]=solution[i]==0 ? $FFFF : power(2,solution[i]-1); //restore square
		}
	}
}
ds_list_destroy(_order);