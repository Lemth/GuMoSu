///@desc vertex_build_cube_square(vbuff,x1,y1,z1,x2,y2,z2)
///@arg vbuff argument0
///@arg x1 argument1
///@arg y1 argument2
///@arg z1 argument3
///@arg x2 argument4
///@arg y2 argument5
///@arg z2 argument6

var swap=false;
var index=HEX2DEC(string_char_at(puzzle[2],square_counter+1));
var color=c_white;
var alpha=1;
if(string_char_at(puzzle[1],square_counter+1)==".") {
	if(index<16) {
		index+=24;
	}
}
if((argument1==argument4 && argument1==round(1000*selection_vector[0])/1000 &&
point_in_rectangle(selection_vector[1],selection_vector[2],min(argument2,argument5),min(argument3,argument6),max(argument2,argument5),max(argument3,argument6)))
|| (argument2==argument5 && argument2==round(1000*selection_vector[1])/1000 &&
point_in_rectangle(selection_vector[0],selection_vector[2],min(argument1,argument4),min(argument3,argument6),max(argument1,argument4),max(argument3,argument6)))
|| (argument3==argument6 && argument3==round(1000*selection_vector[2])/1000 &&
point_in_rectangle(selection_vector[0],selection_vector[1],min(argument1,argument4),min(argument2,argument5),max(argument1,argument4),max(argument2,argument5)))
) {
	color=make_color_hsv(0,0,150);
	if(index>16 && index<56) {
		hover_square=square_counter;
	} else {
		hover_square=-1;
	}
}
if(selected_square==square_counter) {
	if(round(get_timer()/500000)%2==0) {
		index=54;
	} else {
		color=make_color_hsv(0,0,150);
	}
}

var u1=(index%8)/8;
var u2=(1+(index%8))/8;
var v1=floor(index/8)/8;
var v2=(1+floor(index/8))/8;

vertex_position_3d(argument0, argument1,argument2,argument3);
vertex_color(argument0, color, alpha);
vertex_texcoord(argument0,u1,v1);
if(argument3!=argument6) {
    vertex_position_3d(argument0, argument1,argument2,argument6);
	vertex_color(argument0, color, alpha);
    vertex_texcoord(argument0,u2,v1); swap=true;
}
if(argument1!=argument4) {
    vertex_position_3d(argument0, argument4,argument2,argument3);
	vertex_color(argument0, color, alpha);
    if(swap==false) { vertex_texcoord(argument0,u2,v1); swap=true; }
    else { vertex_texcoord(argument0,u1,v2); swap=false; }
}
if(argument2!=argument5) {
    vertex_position_3d(argument0, argument1,argument5,argument3);
    vertex_color(argument0, color, alpha);
    if(swap==true) { vertex_texcoord(argument0,u1,v2); swap=false; }
}
if(argument2!=argument5) {
    vertex_position_3d(argument0, argument1,argument5,argument3);
    vertex_color(argument0, color, alpha);
    vertex_texcoord(argument0,u1,v2); swap=true;
}
if(argument1!=argument4) {
    vertex_position_3d(argument0, argument4,argument2,argument3);
    vertex_color(argument0, color, alpha);
    if(swap==false) { vertex_texcoord(argument0,u1,v2); swap=true; }
    else { vertex_texcoord(argument0,u2,v1); swap=false; }
}
if(argument3!=argument6) {
    vertex_position_3d(argument0, argument1,argument2,argument6);
    vertex_color(argument0, color, alpha);
    if(swap==true) { vertex_texcoord(argument0,u2,v1); swap=false; }
}
vertex_position_3d(argument0, argument4,argument5,argument6);
vertex_color(argument0, color, alpha);
vertex_texcoord(argument0,u2,v2);

square_counter++;
