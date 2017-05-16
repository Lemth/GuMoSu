if(instance_exists(obj_cube)) {
	matrix_set(matrix_world,obj_cube.rotation_matrix);
	vertex_submit(vbuff, pr_linelist,-1);
	matrix_set(matrix_world,matrix_build_identity());
}