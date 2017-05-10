z = 0;
//Current rotation matrix - default with no rotation
current_matrix = matrix_build(0, 0, 0, 
                              0, 0, 0,
                              1, 1, 1);
trans_matrix = matrix_build_identity();
trans_matrix[12]=x;
trans_matrix[13]=y;
trans_matrix[14]=z;
                              

/* START CREATE EVENT */
mouseDown = false;
lastMouseX = mouse_x;
lastMouseY = mouse_y;

moonRotationMatrix = matrix_build_identity();
/* END CREATE EVENT */



//The pointer - just makes things quicker
vertex_format_begin();
vertex_format_add_position_3d();
vertex_format_add_colour();

var VF = vertex_format_end();

vbuff = vertex_create_buffer();

var size = 64;//2048;
vertex_begin(vbuff, VF);

vertex_position_3d(vbuff,0,0,0);
vertex_colour(vbuff, c_red, 1);
vertex_position_3d(vbuff,size,0,0);
vertex_colour(vbuff, c_red, 1);


vertex_position_3d(vbuff,0,0,0);
vertex_colour(vbuff, c_lime, 1);
vertex_position_3d(vbuff,0,size,0);
vertex_colour(vbuff, c_lime, 1);


vertex_position_3d(vbuff,0,0,0);
vertex_colour(vbuff, c_blue, 1);
vertex_position_3d(vbuff,0,0,size);
vertex_colour(vbuff, c_blue, 1);


//Negatives..

vertex_position_3d(vbuff,0,0,0);
vertex_colour(vbuff, c_maroon, 1);
vertex_position_3d(vbuff,-size,0,0);
vertex_colour(vbuff, c_maroon, 1);


vertex_position_3d(vbuff,0,0,0);
vertex_colour(vbuff, c_green, 1);
vertex_position_3d(vbuff,0,-size,0);
vertex_colour(vbuff, c_green, 1);


vertex_position_3d(vbuff,0,0,0);
vertex_colour(vbuff, c_navy, 1);
vertex_position_3d(vbuff,0,0,-size);
vertex_colour(vbuff, c_navy, 1);

vertex_end(vbuff);vertex_freeze(vbuff);

/* */
/*  */

