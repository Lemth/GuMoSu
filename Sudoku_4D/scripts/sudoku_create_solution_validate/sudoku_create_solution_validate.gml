/// @desc sudoku_create_solution_validate()

for(var i=0;i<6;i++) {
	var validate=0;
    for(var j=0;j<16;j++) {
        validate=validate|power(2,solution[16*i+j]-1);
    }
    if(validate!=65535) {
        return false;
    }
}
for(var i=0;i<12;i++) {
	var validate=0;
    for(var j=0;j<16;j++) {
        validate=validate|power(2,solution[_order_xy[16*i+j]]-1);
    }
    if(validate!=65535) {
        return false;
    }
}

return true;
