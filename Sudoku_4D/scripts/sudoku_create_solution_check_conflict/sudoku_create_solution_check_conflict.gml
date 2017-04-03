/// @desc sudoku_create_solution_check_conflict(square)
/// @arg square argument0
var s=argument0;
var xxx=ds_map_find_value(square[| s],"xx");
var yyy=ds_map_find_value(square[| s],"yy");
var zzz=ds_map_find_value(square[| s],"zz");

//show_debug_message(string(ds_list_size(region)));

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

