matrix_set(matrix_world,rotation_matrix);
gpu_set_cullmode(cull_clockwise);
vertex_submit(vertex_buffer, pr_trianglelist, cube_texture);
gpu_set_cullmode(cull_counterclockwise);
vertex_submit(vertex_buffer, pr_trianglelist, cube_texture);
matrix_set(matrix_world,matrix_build_identity());


if(collision_state) {
    
	
	var size=.1;
	var xloc=selection_vector[0];
	var yloc=selection_vector[1];
	var zloc=selection_vector[2];

	vertex_begin(crosshair, VF);

	vertex_position_3d(crosshair,xloc,yloc,zloc);
	vertex_colour(crosshair, c_red, 1);
	vertex_position_3d(crosshair,xloc+size,yloc,zloc);
	vertex_colour(crosshair, c_red, 1);
	vertex_position_3d(crosshair,xloc,yloc,zloc);
	vertex_colour(crosshair, c_orange, 1);
	vertex_position_3d(crosshair,xloc,yloc+size,zloc);
	vertex_colour(crosshair, c_orange, 1);
	vertex_position_3d(crosshair,xloc,yloc,zloc);
	vertex_colour(crosshair, c_yellow, 1);
	vertex_position_3d(crosshair,xloc,yloc,zloc+size);
	vertex_colour(crosshair, c_yellow, 1);

	//Negatives..
	vertex_position_3d(crosshair,xloc,yloc,zloc);
	vertex_colour(crosshair, c_green, 1);
	vertex_position_3d(crosshair,xloc-size,yloc,zloc);
	vertex_colour(crosshair, c_green, 1);
	vertex_position_3d(crosshair,xloc,yloc,zloc);
	vertex_colour(crosshair, c_blue, 1);
	vertex_position_3d(crosshair,xloc,yloc-size,zloc);
	vertex_colour(crosshair, c_blue, 1);
	vertex_position_3d(crosshair,xloc,yloc,zloc);
	vertex_colour(crosshair, c_purple, 1);
	vertex_position_3d(crosshair,xloc,yloc,zloc-size);
	vertex_colour(crosshair, c_purple, 1);

	vertex_end(crosshair);
	
	
	matrix_set(matrix_world,rotation_matrix);
	vertex_submit(crosshair, pr_linelist,-1);
	matrix_set(matrix_world,matrix_build_identity());

    collision_state=0;
}