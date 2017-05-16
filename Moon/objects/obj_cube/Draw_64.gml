var str="rotateMatrix: ";
for(var i=0;i<16;i++) { str+=string(rotation_matrix[i])+", "; }
draw_text(10,10,str);
draw_text(10,30,"deltaX: "+string(delta_x));
draw_text(10,50,"deltay: "+string(delta_y));
draw_text(10,90,"mouse_x: "+string(mouse_x));
draw_text(10,110,"mouse_y: "+string(mouse_y));
