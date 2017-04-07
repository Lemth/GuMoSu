/// @desc sudoku_create_puzzle()

var _order=ds_list_create();
for(var i=0;i<96;i++) {
	puzzle[i]=solution[i];
	ds_list_add(_order,i);
}
ds_list_shuffle(_order);

while(ds_list_size(r_order)>0) { //work through all squares once
	var i=ds_list_find_value(_order,0); //get random square
	ds_list_delete_index(_order,0); //prevent duplicate squares
	
    puzzle[i]=0; //try all values...
    if(sudoku_create_puzzle_solver(i)) { //if solvable then can't remove this square:
		puzzle[i]=solution[i]; //restore square
	}
}

ds_list_destroy(_order);


/// @desc sudoku_create_puzzle_solver(square/inventory)
/// @arg square/inventory argument0

var solved=0;
var inventory=ds_list_create();
if(ds_exists(argument0,ds_type_list)) { //if LIST is supplied
	for(var i=0;i<96;i++) {
		inventory[| i]=ds_list_create();
		ds_list_copy(inventory[| i],argument0[| i]);
	}
} else { //else if SQUARE is supplied
	for(var i=0;i<96;i++) {
		inventory[| i]=ds_list_create();
		if(puzzle[i]>0) { 
			ds_list_add(inventory[| i],puzzle[i]);
			solved++;
		} else {
			ds_list_copy(inventory[| i],_value);
		}
	}
	ds_list_delete_value(inventory[| argument0],solution[argument0]); //Remove solution value from testing square to see alternative solutions!
}

while(solved<96) {
	var solving=true;
	
	for(var i=0;i<96;i++) { // RETURN SINGLES
		if(ds_list_size(inventory[| i])>1) {
			for(var j=0;j<ds_list_size(_allpeers);j++) {
				if(ds_list_size(inventory[| ds_list_find_value(_allpeers[| i],j)])==1) {
					ds_list_delete_value(inventory[| i],ds_list_find_value(inventory[| ds_list_find_value(_allpeers[| i],j)],0));
					solved++;
					solving=false;
				}
			}
		} else if (ds_list_size(inventory[| i])<1) {
			sudoku_create_puzzle_solver_destroy_ds();
			return false; //unsolvable due to 0 possible values for a square
		}
	}
	
	if(solving) {
		for(var i=0;i<96;i++) { // HIDDEN SINGLES
			if(ds_list_size(inventory[| i])>1) {
				var available=0;
				for(var j=0;j<ds_list_size(_allpeers);j++) {
					if(ds_list_size(inventory[| ds_list_find_value(_allpeers[| i],j)])>1) {
						for(var k=0;k<ds_list_size(inventory[| ds_list_find_value(_allpeers[| i],j)];k++) {
							available=available|power(2,ds_list_find_value(inventory[| ds_list_find_value(_allpeers[| i],j)],k)-1); //x OR y
						}
					}
				}
				for(var j=0;j<ds_list_size(inventory[| i]);j++) {
					available=(available^power(2,ds_list_find_value(inventory[| i],j)-1))&power(2,ds_list_find_value(inventory[| i],j)-1); //(x XOR y) AND y
				}
				if(available!=0 && (available&(available-1))==0) {
					ds_list_clear(inventory[| i]);
					ds_list_add(inventory[| i],log2(available)+1);
					solved++;
					solving=false;
				}
			} else if (ds_list_size(inventory[| i])<1) {
				sudoku_create_puzzle_solver_destroy_ds();
				return false; //unsolvable due to 0 possible values for a square
			}
		}
	}

	if(solving) {
		var smallest=0;
		for(var i=0;i<96;i++) { // BRUTE FORCE
			if(ds_list_size(inventory[| i])==2) {
				smallest=i;
				break;
			} else if(ds_list_size(inventory[| i]>2) {
				if(ds_list_size(inventory[| i]<ds_list_size(inventory[| smallest]) {
					smallest=i;	
				}
			}
		}
		var hold_list=ds_list_create();
		ds_list_copy(hold_list,inventory[| smallest]);
		ds_list_clear(inventory[| smallest]);
		ds_list_add(inventory[| smallest],hold_list[| 0]);
		if(sudoku_create_puzzle_solver(inventory)) { //if solvable
			sudoku_create_puzzle_solver_destroy_ds();
			return true; //solvable even in this configuration; not a unique puzzle
		}
		ds_list_delete(hold_list[| 0]);
		ds_list_copy(inventory[| smallest],hold_list);
		ds_list_destroy(hold_list);
		if(ds_list_size(inventory[| smallest])==1) {
			solved++;
		}
	}
}

return sudoku_create_puzzle_validate(inventory); //true: solvable even in this configuration; not a unique puzzle //false: not a valid solution



/// @desc sudoku_create_puzzle_solver_destroy_ds()

for(var i=0;i<96;i++) {
	ds_list_destroy(inventory[| i]);
}
ds_list_destroy(inventory);
