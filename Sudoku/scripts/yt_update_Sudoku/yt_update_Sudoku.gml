/// @desc yt_update_Sudoku(puzzle,column,row)
/// @arg puzzle
/// @arg column
/// @arg row

var puzzle=argument0;
var column=argument1;
var row=argument2;


var number=ds_map_find_value(puzzle[# column,row],"number");

//loop through rows
for(var xx=0;xx<9;xx++) {
	if(ds_list_find_value(ds_map_find_value(puzzle[# column,xx],"possible"),number-1)==0) {
		var solvable=ds_map_find_value(puzzle[# column,xx],"solvable");
		ds_map_replace(puzzle[# column,xx],"solvable",solvable-1);
		
	}
	ds_list_replace(ds_map_find_value(puzzle[# column,xx],"possible"),number-1,1);
}

//loop through columns
for(var xx=0;xx<9;xx++) {
	if(ds_list_find_value(ds_map_find_value(puzzle[# xx,row],"possible"),number-1)==0) {
		var solvable=ds_map_find_value(puzzle[# xx,row],"solvable");
		ds_map_replace(puzzle[# xx,row],"solvable",solvable-1);
		
	}
	ds_list_replace(ds_map_find_value(puzzle[# xx,row],"possible"),number-1,1);
}

return 1;
