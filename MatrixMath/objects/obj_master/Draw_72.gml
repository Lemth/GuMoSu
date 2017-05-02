if (!surface_exists(surf))
{
    surf = surface_create(500,400);
}


surface_set_target(surf);
draw_clear(c_white);
d3d_set_culling(true);
d3d_set_zwriteenable(true);
d3d_set_hidden(true);
draw_set_color(c_white);
matrix_set(matrix_world,obj_world_matrix.matrix);
matrix_set(matrix_view,obj_view_matrix.matrix);
matrix_set(matrix_projection,obj_projection_matrix.matrix);
d3d_model_draw(cube_model,0,0,0,cube_tex);

d3d_set_culling(false);
d3d_set_zwriteenable(false);
d3d_set_hidden(false);

shader_set(sh_draw_vertex);
shader_set_uniform_f(sh_draw_vertex_pos,obj_vertex_transform_world.input[0],obj_vertex_transform_world.input[1],obj_vertex_transform_world.input[2],obj_vertex_transform_world.input[3]);

if (!obj_vertex_transform_world.multiplication_order)
{ matrix_set(matrix_world,transpose4x4(obj_world_matrix.matrix)); }
d3d_model_draw(model_cursor,0,0,0,-1);
shader_reset();

surface_reset_target();



d3d_set_projection_ortho(0,0,room_width,room_height,0);
d3d_transform_set_identity();

draw_surface(surf,612,312);
draw_set_color(c_black);


