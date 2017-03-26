/// @desc solver(list)
/// @arg list	argument0

var solver_inventory=ds_list_create();

for(var i=0;i<81;i++) {
	solver_inventory[| i]=ds_list_create();
	ds_list_copy(solver_inventory[| i],argument0[| i]);
}

var solved=0;
var solving=1;

while(solving==1 || solved==1) {
	solving=0;
	for(var i=0;i<81;i++) {
		if(ds_list_size(solver_inventory[| i])>1) { 			
			//Return each connected single
			solving=max(solving,solver_return_singles(solver_inventory,i)); 
			if(solving=-1) {
				solved=0;
				break;
			}
			//if "1" over any of the past 81 ...
		} else if (ds_list_size(solver_inventory[| i])==0) {
			solving=0;
			solved=0;
			break;
		}
	}
	if(solving==0) {
		//BRUTE FORCE
		var hold=ds_list_create();
		for(var i=0;i<81;i++) {
			if(ds_list_size(solver_inventory[| i])>1) {
				ds_list_copy(hold,solver_inventory[| i]);
				for(var j=0;j<ds_list_size(hold);j++) {
					//try setting values from the list
					ds_list_clear(solver_inventory[| i]);
					ds_list_add(solver_inventory[| i],hold[| j]);
					solving=max(solving,solver(solver_inventory));	
					if(solving==1) {
						break;
					}	

				}
				if(solving==1) {
					solved=1;
					break;
				}
			} else if (ds_list_size(solver_inventory[| i])==0) {
				solving=0;
				solved=0;
				break;
			}
		}
		ds_list_destroy(hold);
	}
}

for(var i=0;i<81;i++) {
	if(ds_list_size(solver_inventory[| i])==0) {
		solved=0;
	}
	ds_list_destroy(solver_inventory[| i]);
}

ds_list_destroy(solver_inventory);

return solved;
