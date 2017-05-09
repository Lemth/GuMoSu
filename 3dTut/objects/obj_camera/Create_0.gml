/// @description Insert description here
// You can write your code in this editor
gpu_set_zwriteenable(true);//Enables writing to the z-buffer
gpu_set_ztestenable(true);//Enables the depth testing, so far away things are drawn beind closer things

//Culling
gpu_set_cullmode(cull_noculling);

//First, we need to enable views and make our view visible (in this case, view 0)
view_enabled = true;//Enable the use of views
view_set_visible(0, true);//Make this view visible

//First, create the camera. We could use camera_create_view, but that is more useful in a 2D environment
camera = camera_create();

//Then, we need to build a projection matrix. I keep this in instance scope in case I need to reassign it later. (Though you can retrieve matrices from a camera with camera_get functions
//I use matrix_build_projection_perspective_fov, as it gives the most control over how your projections looks.
//Here's how I use the arguments: I give a 60 degree vertical field of view, with a ratio of view_wport/view_hport, with a 32 unit near clipping plane, and a 32000 far clipping plane. Some of these values may need tweaking to your liking.
projMat = matrix_build_projection_perspective_fov(60, view_get_wport(0)/view_get_hport(0), 32, 32000);

//Now we assign the projection matrix to the camera
camera_set_proj_mat(camera, projMat);

//Finally, we bind the camera to the view
view_set_camera(0, camera);

//Assigns the update script named "camera_update_script" to the camera belonging to view0
//camera_set_update_script(view_camera[0], camera_update_script);

//Set up camera location
zz = -500;
xx = room_width/2;
yy = room_height/2;
z=zz;
x=xx;
y=yy;

//Build a matrix that looks from the camera location above, to the room center. The up vector points to +z
mLookat = matrix_build_lookat(xx,yy,zz, x,y,0, 0,-1,1);

//Assign the matrix to the camera. This updates were the camera is looking from, without having to unnecessarily update the projection.
camera_set_view_mat(view_camera[0], mLookat);

camera_matrix = matrix_build(0, 0, 0, 
                              0, 0, 0,
                              1, 1, 1);
rho = 500;
theta=0;
phi=0;

radius=500;
cam_x=0;
cam_y=0;
cam_z=0;
camera_rot_mat=matrix_build_identity();
