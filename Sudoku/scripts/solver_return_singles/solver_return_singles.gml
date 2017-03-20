/// @desc solver_find_singles_value(list,square)
/// @arg list	argument0 
/// @arg square	argument1

solver_return_singles_value_var++;  //JUST A VALUE COUNTER

var status=false;

var column=(argument1 mod 9);
var row=floor(argument1/9);

//Check row (move through colummns)
for(var i=0;i<9;i++) {
	if(i!=column) {
		if(ds_list_size(argument0[| row*9+i])==1) {
			status=ds_list_delete_value(argument0[| argument1],ds_list_find_value(argument0[| row*9+i],0));
		}
	}
}

//Check column (move through rows)
for(var i=0;i<9;i++) {
	if(i!=row) {
		if(ds_list_size(argument0[| i*9+column])==1) {
			status=ds_list_delete_value(argument0[| argument1],ds_list_find_value(argument0[| i*9+column],0));
		}
	}
}

//Check regions
var region=(row mod 3)*3+(column mod 3);
for(var i=0;i<9;i++) { //PREVENT DOUBLE CHECKS!
	if(i!=region) {
		if(ds_list_size(argument0[| argument1-(region-i+6*(floor(region/3)-floor(i/3)))])==1) {
			status=ds_list_delete_value(argument0[| argument1],ds_list_find_value(argument0[| argument1-(region-i+6*(floor(region/3)-floor(i/3)))],0));
		}
	}
}


return status;

