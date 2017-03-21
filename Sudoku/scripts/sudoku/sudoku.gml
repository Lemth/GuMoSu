/// @desc sudoku()

sudoku_create_solution();



inventory=ds_list_create();
var order=ds_list_create();

for(var i=0;i<81;i++) {
	inventory[| i]=ds_list_create();
	ds_list_add(inventory[| i],solution[i]);
	ds_list_add(order,i);
}
ds_list_shuffle(order);

remove_rcr=ds_list_create();
var rand_8=irandom(8);
switch(irandom(2)) {
	case 0:
		ds_list_add(remove_rcr,0+9*rand_8,1+9*rand_8,2+9*rand_8,3+9*rand_8,4+9*rand_8,5+9*rand_8,6+9*rand_8,7+9*rand_8,8+9*rand_8);
		break;
	case 1:
		ds_list_add(remove_rcr,0+rand_8,9+rand_8,18+rand_8,27+rand_8,36+rand_8,45+rand_8,54+rand_8,63+rand_8,72+rand_8);
		break;
	case 2:
		ds_list_add(remove_rcr,0+3*rand_8+18*floor(rand_8/3),1+3*rand_8+18*floor(rand_8/3),2+3*rand_8+18*floor(rand_8/3),9+3*rand_8+18*floor(rand_8/3),10+3*rand_8+18*floor(rand_8/3),11+3*rand_8+18*floor(rand_8/3),18+3*rand_8+18*floor(rand_8/3),19+3*rand_8+18*floor(rand_8/3),20+3*rand_8+18*floor(rand_8/3)); // add variations
		break;
}
while(ds_list_size(remove_rcr)>0) {
	ds_list_clear(inventory[| remove_rcr[| 0]]);
	ds_list_delete_value(order,remove_rcr[| 0]);
	ds_list_delete(remove_rcr,0);
}
ds_list_destroy(remove_rcr);

//Try every square once (9 were already removed earlier)
repeat(81-9) {
	i=ds_list_find_value(order,0);
		  ds_list_delete(order,0);
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
ds_list_destroy(order);
