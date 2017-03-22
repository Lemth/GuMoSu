/// @desc yt_box_Singles(puzzle,boxes)
/// @arg puzzle
/// @arg boxes

var puzzle=argument0;
var boxes=argument1;
var temp=0;

//loop through boxes
for(var i=0;i<9;i++) {
	//loop through possible array
	for(var j=0;j<9;j++) {
		var count=0;
		//loop through squares
		for(var xx=0;xx<9;xx++) {
		
			if(ds_map_find_value(ds_list_find_value(ds_map_find_value(boxes[| i],"squares"),xx),"number")!=0) {
				// https://www.youtube.com/watch?v=28lzkKBmyi4 14:06
				continue;
			}
			if(ds_list_find_value(ds_map_find_value(ds_list_find_value(ds_map_find_value(boxes[| i],"squares"),xx),"possible"),j)==0) {
				// https://www.youtube.com/watch?v=28lzkKBmyi4 14:57
				count++;
				temp=xx;
			}
			if(count==2) {
				break;	
			}
		}
		if(count==1) {
			
			//it's solvable https://www.youtube.com/watch?v=28lzkKBmyi4 18:34
			ds_map_replace(ds_list_find_value(ds_map_find_value(boxes[| i],"squares"),temp),"number",j+1);
			unsolved--;
			ds_map_replace(ds_list_find_value(ds_map_find_value(boxes[| i],"squares"),temp),"solvable",0);
			
			// https://www.youtube.com/watch?v=28lzkKBmyi4 19:52
			yt_update_Sudoku(puzzle,ds_map_find_value(ds_list_find_value(ds_map_find_value(boxes[| i],"squares"),temp),"column"),ds_map_find_value(ds_list_find_value(ds_map_find_value(boxes[| i],"squares"),temp),"row"));
			
			return 1;
		}
	}
}
// https://www.youtube.com/watch?v=oUtxBYHrHFY 5:03
return 0;



