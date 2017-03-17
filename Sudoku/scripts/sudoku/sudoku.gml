/// @desc sudoku()

sudoku_create_solution();



inventory=ds_list_create();

for(var i=0;i<81;i++) {
	inventory[| i]=ds_list_create();
	ds_list_add(inventory[| i],solution[i]);
}

//Try every square once
for(var i=0;i<81;i++) {
	//Remove it
	ds_list_clear(inventory[| i]);
	for(var j=1;j<=9;j++) {
		if(j!=solution[i]) {
			//Try every number except for itself
			ds_list_add(inventory[| i],j);
		}
	}
	//Try if solvable with different values
	if(solver(inventory)) {
		//Not a unique sudoku - restore solution value
		ds_list_clear(inventory[| i]);
		ds_list_add(inventory[| i],solution[i]);
	} else {
		//A unique sudoku - add all values
		ds_list_clear(inventory[| i]);
		ds_list_add(inventory[| i],1,2,3,4,5,6,7,8,9);
	}
}

for(var i=0;i<81;i++) {
	if(ds_list_size(inventory[| i])>1) {
		puzzle[i]=0;
	} else {
		puzzle[i]=ds_list_find_value(inventory[| i],0);
	}
	ds_list_destroy(inventory[| i]);
}

ds_list_destroy(inventory);