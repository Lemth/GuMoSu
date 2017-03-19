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
		if(ds_list_size(solver_inventory[| i])>1) {
				
			//For each value in squares list
			var j=0;
			while(j<ds_list_size(solver_inventory[| i])) {
				if(solver_find_singles(solver_inventory,i,ds_list_find_value(solver_inventory[| i],j))) {
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
			
			
		} else if(ds_list_size(solver_inventory[| i])==0) {
			for(var i=0;i<81;i++) {

				ds_list_destroy(solver_inventory[| i]);
			}
			ds_list_destroy(solver_inventory);
			return false;
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