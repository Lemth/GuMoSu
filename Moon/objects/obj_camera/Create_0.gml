gpu_set_zwriteenable(true);//enables writing to the z-buffer
gpu_set_ztestenable(true);//enables the depth testing, so far away things are drawn beind closer things
gpu_set_cullmode(cull_counterclockwise);

//CONSTANTS/
#macro XFROM 0
#macro YFROM 0
#macro ZFROM -5
#macro XTO 0
#macro YTO 0
#macro ZTO 0
#macro XUP 0
#macro YUP 1
#macro ZUP 0
#macro FOV_Y 45
#macro ASPECT (window_get_width()/window_get_height())
#macro ZNEAR 1
#macro ZFAR 10
///CONSTANTS

var camera=camera_create();
var mat_lookat=matrix_build_lookat(XFROM,YFROM,ZFROM, XTO,YTO,ZTO, XUP,YUP,ZUP);
var mat_projection=matrix_build_projection_perspective_fov(FOV_Y,ASPECT,ZNEAR,ZFAR);

view_enabled=true; //enable the use of views
view_set_visible(0,true);//make this view visible
view_set_camera(0,camera); //bind camera to view

camera_set_view_mat(camera,mat_lookat); //assign lookat matrix to view
camera_set_proj_mat(camera,mat_projection); //assign projection matrix to camera

draw_set_color(0);

if(display_aa>=12) { display_reset(8, false); }
else if(display_aa>=6) { display_reset(4, false); }
else if(display_aa>=2) { display_reset(2, false); }
