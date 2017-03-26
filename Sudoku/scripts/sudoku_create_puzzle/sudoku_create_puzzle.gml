/// @desc sudoku_create_puzzle()

var inventory=ds_list_create();
var order=ds_list_create();

for(var i=0;i<81;i++) {
	inventory[| i]=ds_list_create();
	ds_list_add(inventory[| i],solution[i]);
	ds_list_add(order,i);
}
ds_list_shuffle(order);

var remove_rcr=ds_list_create();
var rand_row=irandom(8);
ds_list_add(remove_rcr,0+9*rand_row,1+9*rand_row,2+9*rand_row,3+9*rand_row,4+9*rand_row,5+9*rand_row,6+9*rand_row,7+9*rand_row,8+9*rand_row);
var rand_col=irandom(8);
ds_list_add(remove_rcr,0+rand_col,9+rand_col,18+rand_col,27+rand_col,36+rand_col,45+rand_col,54+rand_col,63+rand_col,72+rand_col);
var rand_reg=((3*floor(rand_col/3)+27*(floor(rand_row/3)+irandom(2))) mod 81);
ds_list_add(remove_rcr,0+rand_reg,1+rand_reg,2+rand_reg,9+rand_reg,10+rand_reg,11+rand_reg,18+rand_reg,19+rand_reg,20+rand_reg);

while(ds_list_size(remove_rcr)>0) {
	ds_list_clear(inventory[| remove_rcr[| 0]]);
	ds_list_add(inventory[| remove_rcr[| 0]],1,2,3,4,5,6,7,8,9);
	ds_list_delete_value(order,remove_rcr[| 0]);
	ds_list_delete(remove_rcr,0);
}
ds_list_destroy(remove_rcr);

//Try every square once (some were already removed earlier)
while(ds_list_size(order)>7) {
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
	if(solver(inventory)==1) {
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