/// @desc sudoku_create_solution_check_conflict(square)
/// @arg square argument0
var s=argument0;

//Check region and columns
for(var i=0;i<ds_list_size(_reduced_peers[| s]);i++) {
    if(solution[ds_list_find_value(_reduced_peers[| s],i)]==solution[s]) {
        return true;
    }
}

return false;
