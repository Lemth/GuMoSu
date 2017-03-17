/// @desc sudoku_create_solution_check_conflict(array,square)
/// @arg array	argument0
/// @arg square	argument1

var column=(argument1 mod 9);
var row=floor(argument1/9);

//Check row (move through previous colummns)
for(var i=column-1;i>=0;i--) {
	if(argument0[@ row*9+i]==argument0[@ argument1]) {
		return true;
	}
}

//Check column (move through previous rows)
for(var i=row-1;i>=0;i--) {
	if(argument0[@ i*9+column]==argument0[@ argument1]) {
		return true;
	}
}

//Check regions
var region=(row mod 3)*3+(column mod 3);
//Prevent double checking rows first 3 rows
if(region<3) {
	return false;
}
//Prevent double checking remaining rows
for(var i=region-(region mod 3)-1;i>=0;i--) {
	//Prevent double checking columns
	if(((region-i) mod 3)==0) {
		continue;
	}
	if(argument0[@ argument1-(region-i+6*(floor(region/3)-floor(i/3)))]==argument0[@ argument1]) {
		return true;
	}
}

return false;

