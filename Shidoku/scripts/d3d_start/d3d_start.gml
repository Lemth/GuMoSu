/// @description d3d - enable 3d

var ret = global.__d3d;
global.__d3d = true;
camera_apply(view_camera[0]);
gpu_set_ztestenable(true);
gpu_set_zwriteenable(true);
return ret;

