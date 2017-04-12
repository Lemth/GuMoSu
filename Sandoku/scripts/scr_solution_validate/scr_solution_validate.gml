/// @desc scr_solution_validate()

for(var i=0;i<18;i++) {
	var array=_arrays[| i];
	var validate=0;
    for(var j=0;j<16;j++) {
        validate=validate|power(2,solution[array[| j]]-1);
    }
    if(validate!=65535) {
        return false;
    }
}

return true;
