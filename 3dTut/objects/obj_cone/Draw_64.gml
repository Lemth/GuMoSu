draw_text(0,0,"TEXT");

draw_text(1,1,"dwadwaEXT");

draw_text(10,10,"dwadddddddddddddwaEXT");


draw_set_color(c_white);
var str="rotateMatrix: ";
for(var i=0;i<16;i++) { str+=string(1)+", "; }
draw_text(view_xport[0],view_yport[0],str);
draw_text(camera_get_view_border_x(view_camera[0]),camera_get_view_border_y(view_camera[0]),"deltaX: "+string(4));
draw_text(1,50,"deltay: "+string(2));
draw_text(0,0,"counter: "+string(3));
draw_text(10,90,"mouse_x: "+string(mouse_x));
draw_text(10,110,"mouse_y: "+string(mouse_y));
draw_sprite_stretched(sprite_1,0,10,view_hport[0]-(sprite_get_height(sprite_1)/2+10),sprite_get_width(sprite_1)/2,sprite_get_height(sprite_1)/2);

