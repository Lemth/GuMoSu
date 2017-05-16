
draw_set_color(0);
var str="rotateMatrix: ";
for(var i=0;i<16;i++) { str+=string(rotation_matrix[i])+", "; }
draw_text(view_xport[0],view_yport[0],str);
draw_text(camera_get_view_border_x(view_camera[0]),camera_get_view_border_y(view_camera[0]),"deltaX: "+string(delta_x));
draw_text(1,50,"deltay: "+string(delta_y));
draw_text(0,0,"counter: "+string(counter));
draw_text(10,90,"mouse_x: "+string(mouse_x));
draw_text(10,110,"mouse_y: "+string(mouse_y));
draw_sprite_stretched(spr_test,0,10,view_hport[0]-(sprite_get_height(spr_test)/2+10),sprite_get_width(spr_test)/2,sprite_get_height(spr_test)/2);
