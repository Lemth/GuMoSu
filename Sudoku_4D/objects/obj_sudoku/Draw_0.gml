var numbers=0;
//if (mouse_check_button(mb_right)) {
if(1==1) {
	for(i=0;i<12;i++) {
		for(j=0;j<16;j++) {
			var block=48*floor(i/4)+4*i+12*floor(j/4)+j;
			if(block<96) {
				if(solution[block]>0) {
					numbers++;
					draw_text(room_width*(i+1)/13,room_height*(j+1)/17,string(solution[block]));
				}
			} else {
				if(solution[loopback[block-96]]>0) {
					draw_set_color(c_gray);
					draw_text(room_width*(i+1)/13,room_height*(j+1)/17,string(solution[loopback[block-96]]));
					draw_set_color(c_black);
				}
			}
		}
	}
} else {
	for(i=0;i<12;i++) {
		for(j=0;j<16;j++) {
			var block=48*floor(i/4)+4*i+12*floor(j/4)+j;
			if(block<96) {
				if(puzzle[block]>0) {
					numbers++;
					draw_text(room_width*(i+1)/13,room_height*(j+1)/17,string(puzzle[block]));
				}
			}
		}
	}
}
draw_text(room_width/2,room_height*16.75/17,"Numbers: "+string(numbers));
draw_text(room_width/2,room_height*0.25/17,"Steps: "+string(step));