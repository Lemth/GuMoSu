draw_set_color(c_red);
var str="rotateMatrix: ";
for(var i=0;i<16;i++) { str+=string(rotation_matrix[i])+", "; }
draw_text(10,10,str);
draw_text(10,30,"pointer_vector (x,y,z): "+string_format(pointer_vector[0],1,5)+", "+string_format(pointer_vector[1],1,5)+", "+string_format(pointer_vector[2],1,5));
draw_text(10,50,"collision_vector (x,y,z,bool): "+string_format(collision_vector[0],1,5)+", "+string_format(collision_vector[1],1,5)+", "+string_format(collision_vector[2],1,5)+", "+string(collision_state));
draw_text(10,70,"selection_vector (x,y,z,bool): "+string_format(selection_vector[0],1,5)+", "+string_format(selection_vector[1],1,5)+", "+string_format(selection_vector[2],1,5)+", "+string(collision_state));
draw_text(10,90,"deltaX: "+string(delta_x));
draw_text(10,110,"deltay: "+string(delta_y));
draw_text(10,130,"mouse_x: "+string(mouse_x));
draw_text(10,150,"mouse_y: "+string(mouse_y));
draw_text(10,170,"HOVER: "+string(hover_square));
draw_text(10,190,"SELECTED: "+string(selected_square));

draw_text(10,room_height-30,"puzzle[2]: "+puzzle[2]+"#");
draw_text(10,room_height-50,"puzzle[1]: "+puzzle[1]+"#");
draw_text(10,room_height-70,"puzzle[0]: "+puzzle[0]+"#");
draw_set_color(c_black);