/// @desc sudoku_create_puzzle_validate()

var validate=0;

for(var i=0;i<6;i++) {
    for(var j=0;j<16;j++) {
        validate=validate|power(2,ds_list_find_value(inventory[| 16*i+j]-1,0));
    }
    if(validate!=65535) {
        return false;
    }
    validate=0;
}
for(var i=0;i<12;i++) {
    for(var j=0;j<16;j++) {
        validate=validate|power(2,ds_list_find_value(inventory[| _order_xy[16*i+j]]-1,0));
    }
    if(validate!=65535) {
        return false;
    }
    validate=0;
}

return true;
