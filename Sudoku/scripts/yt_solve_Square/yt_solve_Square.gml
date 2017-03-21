/// @desc yt_solve_Square(square)
/// @arg square

var square=argument0;

for(var xx=0;xx<9;xx++) {
	if(ds_list_find_value(ds_map_find_value(square,"possible"),xx)==0) {
		ds_map_replace(square,"number",xx+1);
		ds_map_replace(square,"solvable",0);
		unsolved--;
	}
}