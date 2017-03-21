/// @desc yt_update_Boxes(puzzle,row,column)
/// @arg puzzle
/// @arg column
/// @arg row

var puzzle=argument0;
var column=argument1;
var row=argument2;

var number=ds_map_find_value(puzzle[# column,row],"number");
var box=ds_map_find_value(puzzle[# column,row],"box");

for(var xx=0;xx<9;xx++) {
	if(ds_list_find_value(ds_map_find_value(ds_list_find_value(box[? "squares"],xx),"possible"),number-1)==0) {
		ds_map_replace(ds_list_find_value(box[? "squares"],xx),"solvable",ds_map_find_value(ds_list_find_value(box[? "squares"],xx),"solvable")-1);
		ds_list_replace(ds_map_find_value(ds_list_find_value(box[? "squares"],xx),"possible"),number-1,1);
	}
}