/// @desc solver_RCR(list)
/// @arg list	argument0 

solver_RCR_var++;  //JUST A VALUE COUNTER

var singles=ds_list_create();
var multiples_id=ds_list_create();

//Check row (move through colummns)
for(var j=0;j<9;j++) {
	for(var i=0;i<9;i++) {
		if(ds_list_size(argument0[| j*9+i])==1) {
			ds_list_add(singles,ds_list_find_value(argument0[| j*9+i],0));
		} else {
			ds_list_add(multiples_id,argument0[| j*9+i]);
		}
	}
	while(ds_list_size(singles)>0) {
		for(var i=0;i<ds_list_size(multiples_id);i++) {
			ds_list_delete_value(multiples_id,singles[| 0]);
		}
		ds_list_delete(singles,0);
	}
	ds_list_clear(multiples_id);
}

//Check column (move through rows)
for(var j=0;j<9;j++) {
	for(var i=0;i<9;i++) {
		if(ds_list_size(argument0[| i*9+j])==1) {
			ds_list_add(singles,ds_list_find_value(argument0[| i*9+j],0));
		} else {
			ds_list_add(multiples_id,argument0[| i*9+j]);
		}
	}
	while(ds_list_size(singles)>0) {
		for(var i=0;i<ds_list_size(multiples_id);i++) {
			ds_list_delete_value(multiples_id,singles[| 0]);
		}
		ds_list_delete(singles,0);
	}
	ds_list_clear(multiples_id);
}

//Check regions
for(var j=0;j<9;j++) {
	for(var i=0;i<9;i++) { //PREVENT DOUBLE CHECKS!
		if(ds_list_size(argument0[| 18*floor(j/3)-2*(i mod 3)+3*(j+i)])==1) {
			ds_list_add(singles,ds_list_find_value(argument0[| 18*floor(j/3)-2*(i mod 3)+3*(j+i)],0));
		} else {
			ds_list_add(multiples_id,argument0[| 18*floor(j/3)-2*(i mod 3)+3*(j+i)]);
		}
	}
	while(ds_list_size(singles)>0) {
		for(var i=0;i<ds_list_size(multiples_id);i++) {
			ds_list_delete_value(multiples_id,singles[| 0]);
		}
		ds_list_delete(singles,0);
	}
}

ds_list_destroy(singles);
ds_list_destroy(multiples_id);

return true;







/// @desc solver_RCR_complex(list)
/// @arg list	argument0 

var singles=ds_list_create();
var multiples_id=ds_list_create();

for(var i=0;i<27;i++) {
	singles[| i]=ds_list_create();
	multiples_id[| i]=ds_list_create();
}

for(var i=0;i<81;i++) {
	if(ds_list_size(argument0[| i])==1) {
		ds_list_add(singles[| floor(i/9)],ds_list_find_value(argument0[| i],0);
		ds_list_add(singles[| 9+(i mod 9)],ds_list_find_value(argument0[| i],0);	   
		ds_list_add(singles[| 18+(floor(i/9) mod 3)*3+((i mod 9) mod 3)],ds_list_find_value(argument0[| i],0);
        } else {
		ds_list_add(multiples_id[| floor(i/9)],argument0[| i]);
		ds_list_add(multiples_id[| 9+(i mod 9)],argument0[| i]);	   
		ds_list_add(multiples_id[| 18+(floor(i/9) mod 3)*3+((i mod 9) mod 3)],argument0[| i]);
	}
}

for(var i=0;i<27;i++) {
	while(ds_list_size(singles[| i])>0) {
		for(var j=0;j<ds_list_size(multiples_id[| i]);j++) {
			ds_list_delete_value(multiples_id[| i],singles[| 0]);
		}
		ds_list_delete(singles,0);
	}
}
			    
for(var i=0;i<27;i++) {
	ds_list_destroy(singles[| i]);
	ds_list_destroy(multiples_id[| i]);
}

ds_list_destroy(singles);
ds_list_destroy(multiples_id);

return true;


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
