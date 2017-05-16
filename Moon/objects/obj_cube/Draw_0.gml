matrix_set(matrix_world,rotation_matrix);
vertex_submit(vertex_buffer, pr_trianglelist, cube_texture);
matrix_set(matrix_world,matrix_build_identity());
