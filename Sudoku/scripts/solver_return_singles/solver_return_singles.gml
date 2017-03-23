/// @desc solver_return_singles_value(list,square)
/// @arg list	argument0 
/// @arg square	argument1


var status=0;
var size=0;

var column=(argument1 mod 9);
var row=floor(argument1/9);

//Check row (move through colummns)
for(var i=0;i<9;i++) {
	if(i!=column) {
		if(ds_list_size(argument0[| row*9+i])==1) {
			size=ds_list_delete_value(argument0[| argument1],ds_list_find_value(argument0[| row*9+i],0));
			if(size==1) {
				
			} else if(size==0) {
				
			}
		}
	}
}

//Check column (move through rows)
for(var i=0;i<9;i++) {
	if(i!=row) {
		if(ds_list_size(argument0[| i*9+column])==1) {
			if(status=ds_list_delete_value(argument0[| argument1],ds_list_find_value(argument0[| i*9+column],0))==true) {
				status=1;	
			}
		}
	}
}

//Check regions
var region=(row mod 3)*3+(column mod 3);
for(var i=0;i<9;i++) { //PREVENT DOUBLE CHECKS!
	if(i!=region) {
		if(ds_list_size(argument0[| argument1-(region-i+6*(floor(region/3)-floor(i/3)))])==1) {
			if(status=ds_list_delete_value(argument0[| argument1],ds_list_find_value(argument0[| argument1-(region-i+6*(floor(region/3)-floor(i/3)))],0))==true) {
				status=1;	
			}
		}
	}
}


return status;

