/// @desc sudoku_solver(array,[index],[value])
/// @arg array	argument0
/// @arg index	argument1 optional
/// @arg value	argument2 optional 

var arg0=argument0;
//var arg1=argument1;

inventory=ds_list_create();

for(var i=0;i<81;i++) {
	inventory[| i]=ds_list_create();
	if(argument0[@ i]==0) {
		ds_list_add(inventory[| i],1,2,3,4,5,6,7,8,9);
	} else {
		ds_list_add(inventory[| i],argument0[@ i]);
	}
}

for(var i=0;i<81;i++) {
	if(ds_list_size(inventory[| i])>1) {
		for(var k=0;k<9;k++) {
			if(sudoku_solver_check_unique(inventory,i,k)) {
				argument0[@ i]=k;
			}
		}
	} else {
		argument0[@ i]=ds_list_find_value(inventory[| i],0);
	}
}