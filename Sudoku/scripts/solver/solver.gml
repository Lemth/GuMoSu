/// @desc solver(list)
/// @arg list	argument0
//INIT
var hold=0;
var solved=true;
//BEGIN
var solver_inventory=ds_list_create();
for(var i=0;i<81;i++) {
	solver_inventory[| i]=ds_list_create();
	ds_list_copy(solver_inventory[| i],argument0[| i]);
}
//BEGIN




//END
for(var i=0;i<81;i++) {
	if(ds_list_size(solver_inventory[| i])!=1) {
		solved=false;
	}
	ds_list_destroy(solver_inventory[| i]);
}
ds_list_destroy(solver_inventory);
//END
return solved;
