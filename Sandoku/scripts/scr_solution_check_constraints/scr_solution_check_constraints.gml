/// @desc scr_solution_check_constraints(square)
/// @arg square argument0
var s=argument0;

//Check peers
for(var i=0;i<ds_list_size(_peers[| s]);i++) {
    if(solution[ds_list_find_value(_peers[| s],i)]==solution[s]) {
        return true;
    }
}
return false;
