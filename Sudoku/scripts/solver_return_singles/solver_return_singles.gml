/// @desc solver_return_singles(list,square)
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
			if(size==1) { return solver_update_multiples(argument0,row*9+i); }
			else if(size>1) { status=1; }
			else if(size==0) { return -1; }
		}
	}
}

//Check column (move through rows)
for(var i=0;i<9;i++) {
	if(i!=row) {
		if(ds_list_size(argument0[| i*9+column])==1) {
			size=ds_list_delete_value(argument0[| argument1],ds_list_find_value(argument0[| i*9+column],0));
			if(size==1) { return solver_update_multiples(argument0,i*9+column); }
			else if(size>1) { status=1; }
			else if(size==0) { return -1; }
		}
	}
}

//Check regions
var region=(row mod 3)*3+(column mod 3);
for(var i=0;i<9;i++) { //prevent double check:
	var square=18*floor(region/3)-2*(i mod 3)+3*(region+i);
	if(column!=(square mod 9) && row!=floor(square/9)) {
		if(ds_list_size(argument0[| square])==1) {
			size=ds_list_delete_value(argument0[| argument1],ds_list_find_value(argument0[| square],0));
			if(size==1) { return solver_update_multiples(argument0,square); }
			else if(size>1) { status=1; }
			else if(size<=0) { return -1; }
		}
	}
}

return status;



/// @desc solver_update_multiples(id,square)
/// @arg id		argument0
/// @arg square	argument1

