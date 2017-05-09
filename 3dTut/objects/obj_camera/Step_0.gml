
var rotate_const = .05;

//Right-left
theta += (keyboard_check(vk_right) - keyboard_check(vk_left))*rotate_const;
theta=theta mod (2*pi);
//Up-down 
phi += (keyboard_check(vk_up) - keyboard_check(vk_down))*rotate_const;
phi= phi mod (2*pi);

camera_matrix=matrix_build(0,0,0, 
						   rho*sin(phi)*cos(theta),
						   rho*sin(phi)*sin(theta),
						   rho*cos(phi), 
						   1,1,1);


//Build a matrix that looks from the camera location above, to the room center. The up vector points to +z
mLookat = matrix_build_lookat(
				rho*sin(phi)*cos(theta),
				rho*sin(phi)*sin(theta),
				rho*cos(phi), 
				0,0,0, 0,1,1);

//Assign the matrix to the camera. This updates were the camera is looking from, without having to unnecessarily update the projection.
camera_set_view_mat(view_camera[0], mLookat);



/*
cam_y += 2 * (keyboard_check(vk_up) - keyboard_check(vk_down));
cam_y = clamp( cam_y, -90, 90 );
cam_z += 2 * (keyboard_check(vk_right) - keyboard_check(vk_left));
camera_rot_mat =  matrix_build(0, 0, 0, cam_x, cam_y, cam_z, 1, 1, 1);

cam_from_x = camera_rot_mat[4] * -radius;
cam_from_y = camera_rot_mat[5] * -radius;
cam_from_z = camera_rot_mat[6] * -radius;

cam_up_x = camera_rot_mat[8];
cam_up_y = camera_rot_mat[9];
cam_up_z = camera_rot_mat[10];

cam_right_x = camera_rot_mat[0];
cam_right_y = camera_rot_mat[1];
cam_right_z = camera_rot_mat[2];

//Build a matrix that looks from the camera location above, to the room center. The up vector points to +z
mLookat = matrix_build_lookat(
				x+cam_from_x,
				y+cam_from_y,
				z+cam_from_z, 
				x,y,0, cam_up_x,cam_up_y,cam_up_z);

//Assign the matrix to the camera. This updates were the camera is looking from, without having to unnecessarily update the projection.
camera_set_view_mat(view_camera[0], mLookat);
*/