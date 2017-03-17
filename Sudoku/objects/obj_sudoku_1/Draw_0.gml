for(j=0;j<9;j++) {
	for(i=0;i<9;i++) {
		draw_text(room_width*(i+1)/10,room_height*(j+1)/10,string(solution[j*9+i]));
	}
}

