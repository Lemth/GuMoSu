draw_self();

for(var i=0;i<16;i++) {
	for(var j=0;j<12;j++) {
		
		if(squarecolor[| _order_xy[12*i+j]]!=0) {
			draw_set_color(squarecolor[| _order_xy[12*i+j]]);
			draw_rectangle(38*j+x+9+4*floor(j/4),38*i+y+11+4*floor(i/4),38*j+x+45+4*floor(j/4),38*i+y+47+4*floor(i/4),false);
		}
		draw_set_halign(fa_middle);
		draw_set_color(c_black);
		
		if((i>=8 && j>=4) || j>=8) {
			draw_set_color(c_gray);
		}
		var square=inventory[| _order_xy[12*i+j]];
		if(scr_count_binary_ones(square)==1) {
			if(solvedsquare[| _order_xy[12*i+j]]==2) {
				draw_set_color(c_navy);
			} else if (solvedsquare[| _order_xy[12*i+j]]==1) {
				draw_set_color(c_maroon);
			}
			draw_set_font(font_large);
			draw_text(38*j+x+26+4*floor(j/4),38*i+y+10+4*floor(i/4),string(binary_to_index(square)));
			draw_set_font(font_small);
			draw_set_color(c_black);
		} else {
			draw_set_font(font_micro);
			for(var k=0;k<16;k++) {
				if(ds_list_find_value(coloring[| _order_xy[12*i+j]],k)!=0) {
					draw_set_color(ds_list_find_value(coloring[| _order_xy[12*i+j]],k));
					draw_rectangle(38*j+x+9+4*floor(j/4)+9*(k mod 4),38*i+y+11+4*floor(i/4)+9*floor(k/4),38*j+x+18+4*floor(j/4)+9*(k mod 4),38*i+y+20+4*floor(i/4)+9*floor(k/4),false);
				}
				if(square&(1<<k)>0) {
					draw_set_color(c_black);
					draw_text(38*j+x+13+4*floor(j/4)+9.25*(k mod 4),38*i+y+10+4*floor(i/4)+9.25*floor(k/4),string(k+1));
				}
			}
			draw_set_font(font_small);
		}
	}
}
draw_set_font(font_large);
draw_set_color(c_gray);
for(var i=0;i<12;i++) {
	if(i<4) {
		draw_text(38*i+x+28+4*floor(i/4),y-34,"Z"+string(i+1));
	} else if (i<8) {
		draw_text(38*i+x+28+4*floor(i/4),y-34,"Y"+string(i-3));
	} else {
		draw_text(38*i+x+28+4*floor(i/4),y-34,"X"+string(i-7));
	}
}
for(var i=0;i<16;i++) {
	draw_text(x-18,38*i+y+10+4*floor(i/4),string(i+1));
}
draw_set_font(font_small);
draw_set_color(c_black);

draw_set_halign(fa_left);
var xx=bbox_right+10;
var yy=bbox_top;
if(draw_text_button(xx+30,yy-20,"Take Step")) {
	do_step=true;
}
if(draw_text_button(xx+100,yy-20,"Automatic")) {
    automatic=!automatic;
}
draw_status_solver(xx,yy,noone,"Check for solved cells",active[0],status[0]);
draw_status_solver(xx,yy+15,noone,"Show Possibles",active[1],status[1]);
for(var i=0;i<array_length_1d(solver_names);i++) {
	draw_status_solver(xx,yy+30+i*15,2+i,solver_names[i],active[2+i],status[2+i]);
}


draw_set_halign(fa_right);
draw_set_color(c_red);
draw_text(bbox_right,bbox_bottom,errormsg);






draw_set_color(c_black);
draw_set_halign(fa_middle);