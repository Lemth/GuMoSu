///@desc vertex_build_cube();

square_counter=0;

vertex_begin(vertex_buffer, vertex_format);

vertex_build_cube_face(vertex_buffer, -1,-1,-1, 1,1,-1);
vertex_build_cube_face(vertex_buffer, 1,-1,1, -1,-1,-1);
vertex_build_cube_face(vertex_buffer, -1,-1,1, -1,1,-1);
vertex_build_cube_face(vertex_buffer, -1,1,1, 1,-1,1);
vertex_build_cube_face(vertex_buffer, 1,1,-1, -1,1,1);
vertex_build_cube_face(vertex_buffer, 1,-1,-1, 1,1,1);

vertex_end(vertex_buffer);
