/// @desc sudoku_create_solution_check_conflict(square)
/// @arg square argument0
var s=argument0;
var xxx=_value_x[| s];
var yyy=_value_y[| s];
var zzz=_value_z[| s];

//Check region and columns
for(var i=0;i<16;i++) {
    if(xxx[| i]!=square[| s] && solution[ds_map_find_value(xxx[| i],"ss")]==solution[s]) {
        return true;
    }
    if(yyy[| i]!=square[| s] && solution[ds_map_find_value(yyy[| i],"ss")]==solution[s]) {
        return true;
    }
    if(zzz[| i]!=square[| s] && solution[ds_map_find_value(zzz[| i],"ss")]==solution[s]) {
      return true;
    }
}

return false;

