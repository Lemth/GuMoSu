var check=false;
var a=draw_get_alpha();
var color=make_color_hsv(counter*255/96,255,255);
vertex_position_3d(argument0, argument1,argument2,argument3);
vertex_normal(argument0,0,1,0);
if((counter mod 16)==0) {
    color=colors[((counter/16) mod 6)];
    vertex_colour(argument0, color, a);
} else if((counter mod 16)==1) {
    color=colors[(floor(counter/16) mod 6)];
    vertex_color(argument0, color, a);
} else {
    vertex_color(argument0, color, a);
}
vertex_texcoord(argument0,(puzzle[counter] mod 4)/4,floor(puzzle[counter]/4)/4);
if(argument3!=argument6) {
    vertex_position_3d(argument0, argument1,argument2,argument6);
	vertex_normal(argument0,0,1,0);
    vertex_color(argument0, color, a);
    vertex_texcoord(argument0,(1+(puzzle[counter] mod 4))/4,floor(puzzle[counter]/4)/4); check=true;
}
if(argument1!=argument4) {
    vertex_position_3d(argument0, argument4,argument2,argument3);
    vertex_normal(argument0,0,1,0);
    vertex_color(argument0, color, a);
    if(check==false) { vertex_texcoord(argument0,(1+(puzzle[counter] mod 4))/4,floor(puzzle[counter]/4)/4); check=true; }
    else { vertex_texcoord(argument0,(puzzle[counter] mod 4)/4,(1+floor(puzzle[counter]/4))/4); check=false; }
}
if(argument2!=argument5) {
    vertex_position_3d(argument0, argument1,argument5,argument3);
    vertex_normal(argument0,0,1,0);
    vertex_color(argument0, color, a);
    if(check==true) { vertex_texcoord(argument0,(puzzle[counter] mod 4)/4,(1+floor(puzzle[counter]/4))/4); check=false; }
}
if(argument2!=argument5) {
    vertex_position_3d(argument0, argument1,argument5,argument3);
    vertex_normal(argument0,0,1,0);
    vertex_color(argument0, color, a);
    vertex_texcoord(argument0,(puzzle[counter] mod 4)/4,(1+floor(puzzle[counter]/4))/4); check=true;
}
if(argument1!=argument4) {
    vertex_position_3d(argument0, argument4,argument2,argument3);
    vertex_normal(argument0,0,1,0);
    vertex_color(argument0, color, a);
    if(check==false) { vertex_texcoord(argument0,(puzzle[counter] mod 4)/4,(1+floor(puzzle[counter]/4))/4); check=true; }
    else { vertex_texcoord(argument0,(1+(puzzle[counter] mod 4))/4,floor(puzzle[counter]/4)/4); check=false; }
}
if(argument3!=argument6) {
    vertex_position_3d(argument0, argument1,argument2,argument6);
    vertex_normal(argument0,0,1,0);
    vertex_color(argument0, color, a);
    if(check==true) { vertex_texcoord(argument0,(1+(puzzle[counter] mod 4))/4,floor(puzzle[counter]/4)/4); check=false; }
}
vertex_position_3d(argument0, argument4,argument5,argument6);
vertex_normal(argument0,0,1,0);
vertex_color(argument0, color, a);
vertex_texcoord(argument0,(1+(puzzle[counter] mod 4))/4,(1+floor(puzzle[counter]/4))/4);
counter++;