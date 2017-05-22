vertex_format_begin();
vertex_format_add_position_3d();
vertex_format_add_colour();
var VF=vertex_format_end();

vbuff=vertex_create_buffer();
var size=.25;
var xloc=2;
var yloc=1.5;

vertex_begin(vbuff, VF);

vertex_position_3d(vbuff,xloc,yloc,0);
vertex_colour(vbuff, c_red, 1);
vertex_position_3d(vbuff,xloc+size,yloc,0);
vertex_colour(vbuff, c_red, 1);
vertex_position_3d(vbuff,xloc,yloc,0);
vertex_colour(vbuff, c_orange, 1);
vertex_position_3d(vbuff,xloc,yloc+size,0);
vertex_colour(vbuff, c_orange, 1);
vertex_position_3d(vbuff,xloc,yloc,0);
vertex_colour(vbuff, c_yellow, 1);
vertex_position_3d(vbuff,xloc,yloc,size);
vertex_colour(vbuff, c_yellow, 1);

//Negatives..
vertex_position_3d(vbuff,xloc,yloc,0);
vertex_colour(vbuff, c_green, 1);
vertex_position_3d(vbuff,xloc-size,yloc,0);
vertex_colour(vbuff, c_green, 1);
vertex_position_3d(vbuff,xloc,yloc,0);
vertex_colour(vbuff, c_blue, 1);
vertex_position_3d(vbuff,xloc,yloc-size,0);
vertex_colour(vbuff, c_blue, 1);
vertex_position_3d(vbuff,xloc,yloc,0);
vertex_colour(vbuff, c_purple, 1);
vertex_position_3d(vbuff,xloc,yloc,-size);
vertex_colour(vbuff, c_purple, 1);

vertex_end(vbuff);vertex_freeze(vbuff);

