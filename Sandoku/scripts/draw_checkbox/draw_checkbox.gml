/// @desc (x,y,checked)
/// @arg x argument0
/// @arg y argument1
/// @arg checked argument2
var size=string_height("X");
if(mouse_check_button_pressed(mb_left) && point_in_rectangle(mouse_x,mouse_y,argument0,argument1,argument0+size,argument1+size)) {
    checkbox[argument2]=!checkbox[argument2];
}
draw_set_color(c_white);
draw_rectangle(argument0+2,argument1+2,argument0+size-2,argument1+size-2,false);
draw_set_color(c_black);
draw_rectangle(argument0+2,argument1+2,argument0+size-2,argument1+size-2,true);
if(checkbox[argument2]) {
    draw_text(argument0+(string_height("X")-string_width("X")-1)/2+2,argument1,"X");
}