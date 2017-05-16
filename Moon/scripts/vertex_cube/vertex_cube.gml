vertex_format_begin();
vertex_format_add_position_3d();
vertex_format_add_normal();
vertex_format_add_color();
vertex_format_add_texcoord();
vertex_format=vertex_format_end();

vertex_buffer = vertex_create_buffer();
vertex_begin(vertex_buffer, vertex_format);
vertex_face(vertex_buffer, -1,1,1,-1,-1,-1);
vertex_face(vertex_buffer, -1,-1,1,1,-1,-1);
vertex_face(vertex_buffer, -1,1,-1,1,-1,-1);
vertex_face(vertex_buffer, 1,-1,1,1,1,-1);
vertex_face(vertex_buffer, 1,1,1,-1,1,-1);
vertex_face(vertex_buffer, 1,1,1,-1,-1,1);

vertex_end(vertex_buffer);
//vertex_freeze(vertex_buffer);
//vertex_format_delete(vertex_format);