/// @desc sudoku_create_puzzle_validate(list)
/// @arg list argument0

var validate=0;

for(var i=0;i<6;i++) {
    for(var j=0;j<16;j++) {
        validate=validate|power(2,ds_list_find_value(argument0[| 16*i+j]-1,0));
    }
    if(validate!=65535) {
        sudoku_create_puzzle_solver_destroy_ds();
        return false;
    }
    validate=0;
}
for(var i=0;i<12;i++) {
    for(var j=0;j<16;j++) {
        validate=validate|power(2,ds_list_find_value(argument0[| _order_xy[16*i+j]]-1,0));
    }
    if(validate!=65535) {
        sudoku_create_puzzle_solver_destroy_ds();
        return false;
    }
    validate=0;
}

sudoku_create_puzzle_solver_destroy_ds();
return true;
