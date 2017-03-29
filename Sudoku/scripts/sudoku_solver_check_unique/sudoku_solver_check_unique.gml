/// @desc sudoku_solver_check_unique
/// @arg array	argument0 ??
/// @arg square	argument1
/// @arg value	argument2

var array=argument0;
var column=(argument1 mod 9);
var row=floor(argument1/9);

var j=argument2;

//Loop through available values
var value=ds_list_find_value(inventory[| argument1],j);
	
//Check row (move through colummns)
for(var i=0;i<9;i++) {
	if(i!=column) {
		if(ds_list_find_index(inventory[| row*9+i],value)!=-1) {
			return false;
		}
	}
}

//Check column (move through rows)
for(var i=0;i<9;i++) {
	if(i!=row) {
		if(ds_list_find_index(inventory[| i*9+column],value)!=-1) {
			return false;
		}
	}
}

//Check regions
var region=(row mod 3)*3+(column mod 3);
for(var i=0;i<9;i++) {
	//Prevent double checking columns
	//if(((region-i) mod 3)==0) {
	//	continue;
	//}
	if(inventory[| argument1-(region-i+6*(floor(region/3)-floor(i/3)))]!=-1) {
		return false;
	}
}


return true;

