gpu_set_zwriteenable(true);//enables writing to the z-buffer
gpu_set_ztestenable(true);//enables the depth testing, so far away things are drawn beind closer things
gpu_set_cullmode(cull_counterclockwise);

var camera=camera_create();
var mat_projection=matrix_build_projection_perspective_fov(45,window_get_width()/window_get_height(),1,10);
var mat_lookat=matrix_build_lookat(0,0,-5, 0,0,0, 0,1,0);

view_enabled=true; //enable the use of views
view_set_visible(0,true);//make this view visible
view_set_camera(0,camera); //bind camera to view

camera_set_view_mat(camera,mat_lookat); //assign lookat matrix to view
camera_set_proj_mat(camera,mat_projection); //assign projection matrix to camera

draw_set_color(0);

if(display_aa>=12) { display_reset(8, false); }
else if(display_aa>=6) { display_reset(4, false); }
else if(display_aa>=2) { display_reset(2, false); }