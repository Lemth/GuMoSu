/// @desc sudoku_create_puzzle_validate(list)
/// @arg list argument0

var validate=0;

for(var i=0;i<6;i++) { //check faces
    for(var j=0;j<16;j++) {
        validate=validate|power(2,ds_list_find_value(argument0[| 16*i+j]-1,0));
    }
    if(validate!=65535) {
        ds_list_destroy_nested(argument0);
        return false;
    }
    validate=0;
}
for(var i=0;i<12;i++) { //check columns/rows/...
    for(var j=0;j<16;j++) {
        validate=validate|power(2,ds_list_find_value(argument0[| _order_xy[16*i+j]]-1,0));
    }
    if(validate!=65535) {
        ds_list_destroy_nested(argument0);
        return false;
    }
    validate=0;
}

ds_list_destroy_nested(argument0);
return true;
