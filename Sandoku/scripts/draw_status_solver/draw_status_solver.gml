/// @desc draw_status_solver(x,y,checkbox,string,active,status)
/// @arg x argument0
/// @arg y argument1
/// @arg checkbox argument2
/// @arg string argument3
/// @arg active argument4
/// @arg status argument5
if(argument2!=noone) {
    draw_checkbox(argument0,argument1,argument2);
}
if(argument4) {
    draw_text_marked(argument0+20,argument1,argument3,c_olive);
} else {
    draw_text(argument0+20,argument1,argument3);
}
if(argument5!=noone) {
    draw_set_color(c_green);
    if(argument5==0 || argument5=="No") {
        draw_set_color(c_red);
    }
    draw_text(argument0+180,argument1,string(argument5));
    draw_set_color(c_black);
}