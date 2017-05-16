///@desc vertex_build_cube_square(vbuff,x1,y1,z1,x2,y2,z2)
///@arg vbuff argument0
///@arg x1 argument1
///@arg y1 argument2
///@arg z1 argument3
///@arg x2 argument4
///@arg y2 argument5
///@arg z2 argument6

var swap=false;
//var index=status[square_counter]==0?puzzle[square_counter]:39+status[square_counter];
var index=(square_counter mod 16)==0?square_counter/16:(square_counter mod 16);
var u1=(index mod 8)/8;
var u2=(1+(index mod 8))/8;
var v1=floor(index/8)/8;
var v2=(1+floor(index/8))/8;

vertex_position_3d(argument0, argument1,argument2,argument3);
vertex_color(argument0, c_white, 1);
vertex_texcoord(argument0,u1,v1);
if(argument3!=argument6) {
    vertex_position_3d(argument0, argument1,argument2,argument6);
	vertex_color(argument0, c_white, 1);
    vertex_texcoord(argument0,u2,v1); swap=true;
}
if(argument1!=argument4) {
    vertex_position_3d(argument0, argument4,argument2,argument3);
	vertex_color(argument0, c_white, 1);
    if(swap==false) { vertex_texcoord(argument0,u2,v1); swap=true; }
    else { vertex_texcoord(argument0,u1,v2); swap=false; }
}
if(argument2!=argument5) {
    vertex_position_3d(argument0, argument1,argument5,argument3);
    vertex_color(argument0, c_white, 1);
    if(swap==true) { vertex_texcoord(argument0,u1,v2); swap=false; }
}
if(argument2!=argument5) {
    vertex_position_3d(argument0, argument1,argument5,argument3);
    vertex_color(argument0, c_white, 1);
    vertex_texcoord(argument0,u1,v2); swap=true;
}
if(argument1!=argument4) {
    vertex_position_3d(argument0, argument4,argument2,argument3);
    vertex_color(argument0, c_white, 1);
    if(swap==false) { vertex_texcoord(argument0,u1,v2); swap=true; }
    else { vertex_texcoord(argument0,u2,v1); swap=false; }
}
if(argument3!=argument6) {
    vertex_position_3d(argument0, argument1,argument2,argument6);
    vertex_color(argument0, c_white, 1);
    if(swap==true) { vertex_texcoord(argument0,u2,v1); swap=false; }
}
vertex_position_3d(argument0, argument4,argument5,argument6);
vertex_color(argument0, c_white, 1);
vertex_texcoord(argument0,u2,v2);

square_counter++;
