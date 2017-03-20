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
	solver_var++; //JUST A VALUE COUNTER
	solving=false;
	for(var i=0;i<81;i++) {
		var size=ds_list_size(solver_inventory[| i]);
		if(size>1) { // ? SO MUCH FASTER!! LIKE 10 x FASTER THAN SOLVER_FIND_SINGLES
			
			//Return each connected single
		
			solving=solver_return_singles(solver_inventory,i); //39ms
		} else if (size==0) {
			for(var i=0;i<81;i++) {
				if(ds_list_size(solver_inventory[| i])!=1) {
					show_debug_message(string(ds_list_size(solver_inventory[| i])));
					solved=false;
				}
				ds_list_destroy(solver_inventory[| i]);
			}

			ds_list_destroy(solver_inventory);
			return false;
		}
	}
	//solving=solver_RCR(solver_inventory);
	//solving=solver_RCR_complex(solver_inventory);
}

//BRUTE FORCE
var hold=ds_list_create();
for(var i=0;i<81;i++) {
	if(ds_list_size(solver_inventory[| i])>1) {
		ds_list_copy(hold,solver_inventory[| i]);
		for(var j=0;j<ds_list_size(hold);j++) {
			//try setting values from the list
			ds_list_clear(solver_inventory[| i]);
			ds_list_add(solver_inventory[| i],hold[| j]);
			solved=solver(solver_inventory);		

		}
		
		break;
	} else if (size==0) {
		for(var i=0;i<81;i++) {
			if(ds_list_size(solver_inventory[| i])!=1) {
				show_debug_message(string(ds_list_size(solver_inventory[| i])));
				solved=false;
			}
			ds_list_destroy(solver_inventory[| i]);
		}

		ds_list_destroy(solver_inventory);
		return false;
	}
}
ds_list_destroy(hold);



for(var i=0;i<81;i++) {
	if(ds_list_size(solver_inventory[| i])!=1) {
		show_debug_message(string(ds_list_size(solver_inventory[| i])));
		solved=false;
	}
	ds_list_destroy(solver_inventory[| i]);
}

ds_list_destroy(solver_inventory);

return solved;