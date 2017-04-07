var numbers=0;
if (mouse_check_button(mb_left)) {
    for(i=0;i<12;i++) {
        for(j=0;j<16;j++) {
            var block=_order_xy[16*i+j];
            if(puzzle[block]>0) {
                numbers++;
                draw_text(room_width*(i+1)/13,room_height*(j+1)/17,string(puzzle[block]));
			}
        }
    }
} else if (mouse_check_button(mb_right)) {
    for(i=0;i<12;i++) {
        for(j=0;j<16;j++) {
            var block=_order_xy[16*i+j];
            if(check[block]>0) {
                numbers++;
                draw_text(room_width*(i+1)/13,room_height*(j+1)/17,string(check[block]));
			}
        }
    }
} else {
    for(i=0;i<12;i++) {
        for(j=0;j<16;j++) {
            var block=_order_xy[16*i+j];
            if(solution[block]>0) {
                numbers++;
                draw_text(room_width*(i+1)/13,room_height*(j+1)/17,string(solution[block]));
			}
        }
    }
}
draw_text(room_width/2,room_height*16.75/17,"Numbers: "+string(numbers));
draw_text(room_width/2,room_height*0.25/17,"Steps: "+string(step));

