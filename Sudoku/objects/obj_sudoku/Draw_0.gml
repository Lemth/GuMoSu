numbers=0;
for(j=0;j<9;j++) {
	for(i=0;i<9;i++) {
		if(puzzle[j*9+i]!=0) {
			numbers++;
			draw_text(room_width*(i+1)/10,room_height*(j+1)/10,string(puzzle[j*9+i]));
		}
	}
}
draw_text(room_width/2,room_height*9.75/10,"Numbers: "+string(numbers));
draw_text(room_width/5,room_height*0.25/10,"Solver loops: "+string(solver_var));
draw_text(room_width*4/5,room_height*0.25/10,"Find S: "+string(solver_find_singles_value_var));
draw_text(room_width/2,room_height*0.25/10,"Return S: "+string(solver_return_singles_value_var));