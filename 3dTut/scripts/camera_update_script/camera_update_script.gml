//Set up camera location
var zz = -500;
var xx = room_width/2;
var yy = room_height/2;

//Build a matrix that looks from the camera location above, to the room center. The up vector points to +z
mLookat = matrix_build_lookat(xx,yy,zz, xx+0.0001,yy,0, 0,1,1);

//Assign the matrix to the camera. This updates were the camera is looking from, without having to unnecessarily update the projection.
camera_set_view_mat(view_camera[0], mLookat);