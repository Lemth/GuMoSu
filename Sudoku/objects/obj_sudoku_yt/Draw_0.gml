numbers=0;
for(j=0;j<9;j++) {
	for(i=0;i<9;i++) {
		//if(ds_map_find_value(sudoku_grid[# i,j],"number")!=0) {
		if(puzzle[j*9+i]!=0)
			numbers++;
			//draw_text(room_width*(i+1)/10,room_height*(j+1)/10,string(puzzle[i,j]));
			//draw_text(room_width*(i+1)/10,room_height*(j+1)/10,string(ds_map_find_value(sudoku_grid[# i,j],"number")));
			draw_text(room_width*(i+1)/10,room_height*(j+1)/10,string(puzzle[j*9+i]));
		}
	}
}
draw_text(room_width/2,room_height*9.75/10,"Numbers: "+string(numbers));
