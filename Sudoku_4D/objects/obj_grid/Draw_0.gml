for(var i=0;i<13;i++) { //vertical lines
    draw_line_width(room_width*(i+0.5)/13,room_height*0.5/17,room_width*(i+0.5)/13,room_height*16.5/17,2-sign(i mod 4));
}

for(var i=0;i<17;i++) { //horizontal lines
    draw_line_width(room_width*0.5/13,room_height*(i+0.5)/17,room_width*12.5/13,room_height*(i+0.5)/17,2-sign(i mod 4));
}
