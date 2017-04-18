/// @desc draw_text_marked(x,y,string,color)
/// @arg x argument0
/// @arg y argument1
/// @arg string argument2
/// @arg color argument3
if(argument3!=false) {
    draw_set_color(argument3);
}
draw_rectangle(argument0,argument1,argument0+string_width(argument2),argument1+string_height(argument2),false);
draw_set_color(c_black);
draw_text(argument0,argument1,argument2);