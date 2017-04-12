draw_self();

for(var i=0;i<16;i++) {
	for(var j=0;j<12;j++) {
		draw_set_color(c_black);
		if((i>=8 && j>=4) || j>=8) {
			draw_set_color(c_white);
		}
		draw_text(20*j+x+10,20*i+y+1,string(solution[_order_xy[12*i+j]]));
	}
}
draw_set_color(c_gray);
for(var i=0;i<12;i++) {
	if(i<4) {
		draw_text(20*i+x+10,y-16,"Z"+string(i+1));
	} else if (i<8) {
		draw_text(20*i+x+10,y-16,"Y"+string(i-3));
	} else {
		draw_text(20*i+x+10,y-16,"X"+string(i-7));
	}
}
for(var i=0;i<16;i++) {
	draw_text(x-8,20*i+y+1,string(i+1));
}

draw_set_halign(fa_left);
if(valid) {
	draw_set_color(c_green);
	draw_text(x,bbox_bottom,"Valid Solution");
} else {
	draw_set_color(c_red);
	draw_text(x,bbox_bottom,"Invalid Solution!");
}

draw_set_halign(fa_right);
draw_text(bbox_right,bbox_bottom,"["+string(step)+" steps - "+string(round(time/1000))+"ms]");

draw_set_halign(fa_center);
draw_set_color(c_black);