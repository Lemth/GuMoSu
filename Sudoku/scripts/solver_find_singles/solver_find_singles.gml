/// @desc solver_find_singles(list,square,value)
/// @arg list	argument0 
/// @arg square	argument1
/// @arg value	argument2

solver_find_singles_var++;  //JUST A VALUE COUNTER

var column=(argument1 mod 9);
var row=floor(argument1/9);

//Check row (move through colummns)
for(var i=0;i<9;i++) {
	if(i!=column) {
		if(ds_list_size(argument0[| row*9+i])==1) {
			if(ds_list_find_index(argument0[| row*9+i],argument2)!=-1) {
				return true;
			}
		}
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

