
d3d_set_projection_ext(0,0,-128,0,0,0,0,-1,0,75,room_width/room_height, 32, 32000);

//To keep things simple, I'll just draw a triangle based pyramid - this should keep roll and direction visible

draw_set_color(c_white);


//Add the matrix to the current world transform
matrix_set(matrix_world, matrix_multiply(matrix_get(matrix_world), current_matrix));


d3d_transform_add_translation(x,y,z);

var s = 16;
var sqs = sqrt(s);

d3d_set_lighting(false);
vertex_submit(vbuff, pr_linelist,-1);
d3d_set_lighting(true);

d3d_draw_cone(-s,-s,s,s,s,-s,-1,1,1,1,3);


d3d_transform_set_identity();


