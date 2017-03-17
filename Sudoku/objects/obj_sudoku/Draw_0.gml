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
draw_text(room_width/4,room_height*0.25/10,"Solver steps: "+string(solver_var));
draw_text(room_width*3/4,room_height*0.25/10,"Check exists: "+string(solver_check_exists_var));