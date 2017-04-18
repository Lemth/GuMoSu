/// @desc draw_text_button(x,y,string)
/// @arg x argument0
/// @arg y argument1
/// @arg string argument2
var clicked=false;
draw_set_color(c_red);
if(point_in_rectangle(mouse_x,mouse_y,argument0,argument1,argument0+string_width(argument2),argument1+string_height(argument2))) {
    draw_set_color(c_blue);
}
draw_rectangle(argument0,argument1,argument0+string_width(argument2),argument1+string_height(argument2),false);
draw_set_color(c_blue);
if(mouse_check_button(mb_left) && point_in_rectangle(mouse_x,mouse_y,argument0,argument1,argument0+string_width(argument2),argument1+string_height(argument2))) {
    draw_set_color(c_red);
    if(mouse_check_button_pressed(mb_left)) {
        clicked=true;
    }
}
draw_rectangle(argument0,argument1,argument0+string_width(argument2),argument1+string_height(argument2),true);
draw_set_color(c_white);
draw_text(argument0,argument1,argument2);
draw_set_color(c_black);
return clicked;