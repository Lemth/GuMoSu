/// @desc solver(list)
/// @arg list	argument0

var solver_inventory=ds_list_create();

for(var i=0;i<81;i++) {
	solver_inventory[| i]=ds_list_create();
	ds_list_copy(solver_inventory[| i],argument0[| i]);
}

var solved=true;
var solving=true;

while(solving) {
	solving=false;
	for(var i=0;i<81;i++) {
		if(ds_list_size(solver_inventory[| i])>1) { 			
			//Return each connected single
			solving=solver_return_singles(solver_inventory,i);
			
		} else if (ds_list_size(solver_inventory[| i])==0) {
			solving=false;
			break;
		}
	}
}

for(var i=0;i<81;i++) {
	if(ds_list_size(solver_inventory[| i])==0) {
		solved=false;
	}
	ds_list_destroy(solver_inventory[| i]);
}

ds_list_destroy(solver_inventory);

return solved;
