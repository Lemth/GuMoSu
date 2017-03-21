/// @desc solver(list)
/// @arg list	argument0
//INIT
var hold=ds_list_create();
var solved=true;
//BEGIN
var solver_inventory=ds_list_create();
for(var i=0;i<81;i++) {
	solver_inventory[| i]=ds_list_create();
	ds_list_copy(solver_inventory[| i],argument0[| i]);
}
//BEGIN

//Constraint Propagation
while(solver_RCR_complex(solver_inventory)) { }

//Search
for(var j=2;j<=9;j++) {
	for(var i=0;i<81;i++) {
		if(ds_list_size(solver_inventory[| i])==j) {
			ds_list_copy(hold,solver_inventory[| i]);
			while(ds_list_size(hold)>0) {
				ds_list_clear(solver_inventory[| i]);
				ds_list_add(solver_inventory[| i],hold[| 0]);
				if(solver(solver_inventory)) {
					//A solution!
					break;
				} else {
					//No solution... try next value
					ds_list_delete(hold,0);
				}
			}
			break;
		}
	}
	if(solved==false) {
		break;
	}
}

//END
for(var i=0;i<81;i++) {
	if(ds_list_size(solver_inventory[| i])!=1) {
		solved=false;
	}
	ds_list_destroy(solver_inventory[| i]);
}
ds_list_destroy(solver_inventory);
ds_list_destroy(hold);
//END
return solved;
