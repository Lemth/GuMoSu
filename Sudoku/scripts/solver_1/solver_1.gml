/// @desc solver_RCR(list)
/// @arg list	argument0 

solver_RCR_var++;  //JUST A VALUE COUNTER

var singles=ds_list_create();
var multiples_id=ds_list_create();

//Check row (move through colummns)
for(var j=0;j<9;j++) { // go from i. please.
	for(var i=0;i<9;i++) {
		if(ds_list_size(argument0[| j*9+i])==1) {
			ds_list_add(singles,ds_list_find_value(argument0[| j*9+i],0));
		} else {
			ds_list_add(multiples_id,argument0[| j*9+i]);
		}
		var id_count=ds_list_size(multiples_id);
		while(ds_list_size(singles)>0) {
			for(var h=0;h<id_count;h++) {
				ds_list_delete_value(argument0[| j*9+i],singles[| 0]);
			}
			ds_list_delete(singles,0);
		}
		ds_list_clear(multiples_id);
	}
}

//Check column (move through rows)
for(var i=0;i<9;i++) {
	if(i!=row) {
		if(ds_list_size(argument0[| i*9+column])==1) {
			if(ds_list_find_index(argument0[| i*9+column],argument2)!=-1) {
				return true;
			}
		}
	}
}

//Check regions
var region=(row mod 3)*3+(column mod 3);
for(var i=0;i<9;i++) { //PREVENT DOUBLE CHECKS!
	if(i!=region) {
		if(ds_list_size(argument0[| argument1-(region-i+6*(floor(region/3)-floor(i/3)))])==1) {
			if(ds_list_find_index(argument0[| argument1-(region-i+6*(floor(region/3)-floor(i/3)))],argument2)!=-1) {
				return true;
			}
		}
	}
}


return false;












/*


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
				*/ /* 
				//Hidden Singles
				if(solver_check_unique(solver_inventory,i,ds_list_find_value(solver_inventory[| i],j))) {
					var hold=ds_list_find_value(solver_inventory[| i],j);
					ds_list_clear(solver_inventory[| i]);
					ds_list_add(solver_inventory[| i],hold);
					solving=true;
					break;
				}*/ /*
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

*/
