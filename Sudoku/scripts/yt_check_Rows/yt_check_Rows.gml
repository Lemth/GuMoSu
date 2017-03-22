/// @desc yt_check_Rows(square,boxes)
/// @arg square
/// @arg boxes
// https://www.youtube.com/watch?v=Nc7eCcTkzxg 2:59

show_debug_message("We got here!");

var sum=ds_list_create();
var place=ds_list_create();

//loop through rows
for(var i=0;i<9;i++) {
	
	//initialize sum and palce to 0 (9 times)
	ds_list_clear(sum);
	ds_list_add(sum,0,0,0,0,0,0,0,0,0);
	ds_list_clear(place);
	ds_list_add(place,0,0,0,0,0,0,0,0,0);
	
	//loop through each square in the row
	for(var j=0;j<9;j++) {
		// https://www.youtube.com/watch?v=Nc7eCcTkzxg 5:49
		if(ds_map_find_value(sudoku_grid[# j,i],"number") != 0) {
			continue;	
		}
	    	
		//loop through all possibles
		for(var k=0;k<9;k++) {
			// https://www.youtube.com/watch?v=Nc7eCcTkzxg 6:44
			// check if number k is possible
			if(ds_list_find_value(ds_map_find_value(sudoku_grid[# j,i],"possible"),k) == 0) {
				sum[| k]++;
				place[| k]=j;
			}
		}
	}
	    
	// https://www.youtube.com/watch?v=Nc7eCcTkzxg 9:24
	for (var k=0;k<9;k++) {
		if(sum[| k]==1) {
			// https://www.youtube.com/watch?v=Nc7eCcTkzxg 13:37
			ds_map_replace(sudoku_grid[# place[| k],i],"number",k+1);
			// https://www.youtube.com/watch?v=Nc7eCcTkzxg 15:55
			ds_map_replace(sudoku_grid[# place[| k],i],"solvable",0);
			unsolved--;
			
			// https://www.youtube.com/watch?v=Nc7eCcTkzxg 16:37
			yt_update_Sudoku(sudoku_grid,place[|k],i);
			yt_update_Boxes(sudoku_grid,place[|k],i);
			
			ds_list_destroy(sum);
			ds_list_destroy(place);
			return 1;
		}
	}
}


ds_list_destroy(sum);
ds_list_destroy(place);
return 0;
