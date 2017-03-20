/// @desc solver_RCR(list)
/// @arg list	argument0 
var status=false;
var status2=false;

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
			status=ds_list_delete_value(multiples_id[| i],singles[| 0]);
			if(status==true) { status2=true; }
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
			status=ds_list_delete_value(multiples_id[| i],singles[| 0]);
			if(status==true) { status2=true; }
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
			status=ds_list_delete_value(multiples_id[| i],singles[| 0]);
			if(status==true) { status2=true; }
		}
		ds_list_delete(singles,0);
	}
}

ds_list_destroy(singles);
ds_list_destroy(multiples_id);

return status2;