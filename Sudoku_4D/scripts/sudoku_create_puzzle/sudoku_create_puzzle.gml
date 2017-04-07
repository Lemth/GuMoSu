/// @desc sudoku_create_puzzle()

if(test1==0) {
_order=ds_list_create();
for(var i=0;i<96;i++) {
	puzzle[i]=solution[i];
	ds_list_add(_order,i);
}
ds_list_shuffle(_order);
test1=1;
}

if(ds_list_size(_order)>0) { //work through all squares once
	var i=ds_list_find_value(_order,0); //get random square
	ds_list_delete(_order,0); //prevent duplicate squares
	
    puzzle[i]=0; //try all values...
    if(sudoku_create_puzzle_solver(i)) { //if solvable then can't remove this square:
		puzzle[i]=solution[i]; //restore square
	}
}

/*
ds_list_destroy(_order);
*/



