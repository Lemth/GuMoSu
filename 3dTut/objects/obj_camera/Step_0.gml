var rotate_const = .05;

//Right-left
theta += (keyboard_check(vk_right) - keyboard_check(vk_left))*rotate_const;
theta=theta mod (2*pi);
//Up-down 
phi += (keyboard_check(vk_up) - keyboard_check(vk_down))*rotate_const;
phi= phi mod pi;

rho=sqrt(sqr(rho*sin(phi)*cos(theta))+sqr(rho*sin(phi)*sin(theta))+sqr(rho*cos(phi)));


//Build a matrix that looks from the camera location above, to the room center. The up vector points to +z
mLookat = matrix_build_lookat(
				rho*sin(phi)*cos(theta),
				rho*sin(phi)*sin(theta),
				rho*cos(phi), 
				x,y,0, 0,1,1);

//Assign the matrix to the camera. This updates were the camera is looking from, without having to unnecessarily update the projection.
camera_set_view_mat(view_camera[0], mLookat);