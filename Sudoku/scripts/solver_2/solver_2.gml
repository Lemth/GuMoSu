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
	/*
	for(var i=0;i<81;i++) {
		var size=ds_list_size(solver_inventory[| i]);
		if(size>1) { // ? SO MUCH FASTER!! LIKE 10 x FASTER THAN SOLVER_FIND_SINGLES
			
			//Return each connected single
		
			solving=solver_return_singles(solver_inventory,i); 39ms
			
			
		/*} else if(size>1) { 
				
			//For each value in squares list: find singles
			
			var j=0;
			while(j<ds_list_size(solver_inventory[| i])) {
				if(solver_find_singles(solver_inventory,i,ds_list_find_value(solver_inventory[| i],j))) {
					ds_list_delete(solver_inventory[| i],j);
					solving=true;
					continue;
				}
				j++;
			}*/ /*
		} else if (size==0) {
			solving=false;
			break;
		}
	}
	*/
	
	//solving=solver_RCR(solver_inventory); //21ms
	solving=solver_RCR_complex(solver_inventory);
	
}



for(var i=0;i<81;i++) {
	if(ds_list_size(solver_inventory[| i])==0) {
		solved=false;
	}
	ds_list_destroy(solver_inventory[| i]);
}

ds_list_destroy(solver_inventory);

return solved;