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
				
			//For each value in squares list
			var j=0;
			while(j<ds_list_size(solver_inventory[| i])) {
				if(solver_check_exists(solver_inventory,i,ds_list_find_value(solver_inventory[| i],j))) {
					ds_list_delete(solver_inventory[| i],j);
					solving=true;
					continue;
				}
				/*//Hidden Singles
				if(solver_check_unique(solver_inventory,i,ds_list_find_value(solver_inventory[| i],j))) {
					var hold=ds_list_find_value(solver_inventory[| i],j);
					ds_list_clear(solver_inventory[| i]);
					ds_list_add(solver_inventory[| i],hold);
					solving=true;
					break;
				}*/
				j++;
			}
			
			
		}
	}
}
/*//Brute force
for(var i=0;i<81;i++) {
	if(ds_list_size(solver_inventory[| i])>1) {
		for(var j=0;j<solver_inventory[| i];j++) {
			//try setting values from the list
			var hold=ds_list_create();
			ds_list_copy(hold,solver_inventory[| i]);
			ds_list_clear(solver_inventory[| i]);
			ds_list_add(solver_inventory[| i],hold[| j]);
			if(solver(solver_inventory)) {
				
				for(var i=0;i<81;i++) {
					ds_list_destroy(solver_inventory[| i]);
				}

				ds_list_destroy(solver_inventory);
				ds_list_destroy(hold);

				return true;
				
				
			} else {
				ds_list_copy(solver_inventory[| i],hold);
				ds_list_delete(solver_inventory[| i],j);
				ds_list_destroy(hold);
				j--;
			}
		}
	}
}*/


for(var i=0;i<81;i++) {
	show_debug_message(string(ds_list_size(solver_inventory[| i])));
	if(ds_list_size(solver_inventory[| i])!=1) {
		solved=false;
	}
	ds_list_destroy(solver_inventory[| i]);
}

ds_list_destroy(solver_inventory);

return solved;