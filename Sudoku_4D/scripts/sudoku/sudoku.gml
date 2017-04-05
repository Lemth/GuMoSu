/// @desc sudoku_create_puzzle()

var solver_inventory=ds_list_create();
var solver_order=ds_list_create();
for(var i=0;i<96;i++) {
	solver_inventory[| i]=ds_list_create();
	ds_list_add(solver_inventory[| i],solution[i]);
    ds_list_add(solver_order,i);
}
ds_list_shuffle(solver_order);

for(var i=0;i<96;i++) {
    //remove number
    
    //try solve
    
    //posisble? then return number
    
    //do until all solved (BREAK)
    //or not solvable anymore (BRUTE FORCE 1 round, then continue)
    
}

