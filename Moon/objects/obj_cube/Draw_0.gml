
matrix_set(matrix_world,rotation_matrix);
//tex=sprite_get_texture(spr_test,0);
vertex_submit(vertex_buffer, pr_trianglelist, -1);
matrix_set(matrix_world,matrix_build_identity());
