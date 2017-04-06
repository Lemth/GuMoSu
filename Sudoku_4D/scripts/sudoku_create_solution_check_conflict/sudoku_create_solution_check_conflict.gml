/// @desc sudoku_create_solution_check_conflict(square)
/// @arg square argument0
var s=argument0;

//Check region and columns
for(var i=0;i<ds_list_size(_peers[| _order_s[s]]);i++) {
    if(solution[ds_list_find_value(_peers[| _order_s[s]],i)]==solution[_order_s[s]]) {
        return true;
    }
}

return false;
