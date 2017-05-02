/// @description Draw the projection
// Get the view direction vector

var vect_x = lengthdir_x(1,dir);
var vect_y = lengthdir_y(1,dir);

var camera_x = x;
var camera_y = y;
var camera_z = z;
var camera_direction = dir;
var camera_pitch = pitch;
var w = 640;
var h = 360;


// Set the projection
////d3d_set_projection(x,y,z,vect_x,vect_y,z,0,0,1);
d3d_set_projection_ext(camera_x,camera_y,camera_z,camera_x + lengthdir_x(1,camera_direction),camera_y + lengthdir_y(1,camera_direction),camera_z + lengthdir_y(1,camera_pitch),0,0,1,fov,w/h,1,3200)
