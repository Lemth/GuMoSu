global.insert = false;
global.focus_object = noone;

draw_set_valign(fa_center);
draw_set_halign(fa_center);
draw_set_font(font0);

d3d_start();
d3d_set_culling(true);

surf = -1;

sh_draw_vertex_pos = shader_get_uniform(sh_draw_vertex,"pos");



//cube model
//////////////////////////////////////////////////////////////
cube_tex = background_get_texture(bck_cube);
cube_model = d3d_model_create();
cube_radius = 100;
d3d_model_primitive_begin(cube_model,pr_trianglelist);
//top face
d3d_model_vertex_texture(cube_model,-cube_radius,cube_radius,cube_radius,0,1);
d3d_model_vertex_texture(cube_model,cube_radius,-cube_radius,cube_radius,0.125,0);
d3d_model_vertex_texture(cube_model,cube_radius,cube_radius,cube_radius,0.125,1);

d3d_model_vertex_texture(cube_model,-cube_radius,cube_radius,cube_radius,0,1);
d3d_model_vertex_texture(cube_model,-cube_radius,-cube_radius,cube_radius,0,0);
d3d_model_vertex_texture(cube_model,cube_radius,-cube_radius,cube_radius,0.125,0);
//bottom face
d3d_model_vertex_texture(cube_model,-cube_radius,-cube_radius,-cube_radius,0.125,1);
d3d_model_vertex_texture(cube_model,cube_radius,cube_radius,-cube_radius,0.25,0);
d3d_model_vertex_texture(cube_model,cube_radius,-cube_radius,-cube_radius,0.25,1);

d3d_model_vertex_texture(cube_model,-cube_radius,-cube_radius,-cube_radius,0.125,1);
d3d_model_vertex_texture(cube_model,-cube_radius,cube_radius,-cube_radius,0.125,0);
d3d_model_vertex_texture(cube_model,cube_radius,cube_radius,-cube_radius,0.25,0);



//back face
d3d_model_vertex_texture(cube_model,-cube_radius,cube_radius,-cube_radius,0.375,1);
d3d_model_vertex_texture(cube_model,cube_radius,cube_radius,cube_radius,0.5,0);
d3d_model_vertex_texture(cube_model,cube_radius,cube_radius,-cube_radius,0.5,1);

d3d_model_vertex_texture(cube_model,-cube_radius,cube_radius,-cube_radius,0.375,1);
d3d_model_vertex_texture(cube_model,-cube_radius,cube_radius,cube_radius,0.375,0);
d3d_model_vertex_texture(cube_model,cube_radius,cube_radius,cube_radius,0.5,0);


//front face
d3d_model_vertex_texture(cube_model,cube_radius,-cube_radius,-cube_radius,0.25,1);
d3d_model_vertex_texture(cube_model,-cube_radius,-cube_radius,cube_radius,0.375,0);
d3d_model_vertex_texture(cube_model,-cube_radius,-cube_radius,-cube_radius,0.375,1);

d3d_model_vertex_texture(cube_model,cube_radius,-cube_radius,-cube_radius,0.25,1);
d3d_model_vertex_texture(cube_model,cube_radius,-cube_radius,cube_radius,0.25,0);
d3d_model_vertex_texture(cube_model,-cube_radius,-cube_radius,cube_radius,0.375,0);


//left face
d3d_model_vertex_texture(cube_model,-cube_radius,-cube_radius,-cube_radius,0.5,1);
d3d_model_vertex_texture(cube_model,-cube_radius,cube_radius,cube_radius,0.625,0);
d3d_model_vertex_texture(cube_model,-cube_radius,cube_radius,-cube_radius,0.625,1);

d3d_model_vertex_texture(cube_model,-cube_radius,-cube_radius,-cube_radius,0.5,1);
d3d_model_vertex_texture(cube_model,-cube_radius,-cube_radius,cube_radius,0.5,0);
d3d_model_vertex_texture(cube_model,-cube_radius,cube_radius,cube_radius,0.625,0);
//right face
d3d_model_vertex_texture(cube_model,cube_radius,cube_radius,-cube_radius,0.625,1);
d3d_model_vertex_texture(cube_model,cube_radius,-cube_radius,cube_radius,0.75,0);
d3d_model_vertex_texture(cube_model,cube_radius,-cube_radius,-cube_radius,0.75,1);

d3d_model_vertex_texture(cube_model,cube_radius,cube_radius,-cube_radius,0.625,1);
d3d_model_vertex_texture(cube_model,cube_radius,cube_radius,cube_radius,0.625,0);
d3d_model_vertex_texture(cube_model,cube_radius,-cube_radius,cube_radius,0.75,0);

d3d_model_primitive_end(cube_model);


//3d cursor
//////////////////////////////////////////////////////////////
model_cursor = d3d_model_create();
d3d_model_primitive_begin(model_cursor,pr_linelist);
d3d_model_vertex_colour(model_cursor,10,14.14213562,-10,c_red,1);
d3d_model_vertex_colour(model_cursor,-10,-14.14213562,10,c_red,1);
d3d_model_vertex_colour(model_cursor,-10,14.14213562,10,c_green,1);
d3d_model_vertex_colour(model_cursor,10,-14.14213562,-10,c_green,1);
d3d_model_vertex_colour(model_cursor,14.14213562,0,14.14213562,c_blue,1);
d3d_model_vertex_colour(model_cursor,-14.14213562,0,-14.14213562,c_blue,1);
d3d_model_primitive_end(model_cursor);


