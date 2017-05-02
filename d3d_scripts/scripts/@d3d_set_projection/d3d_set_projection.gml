/// @description  @description d3d - set projection 
/// @param xFrom	x of from position
/// @param yFrom	y of from position
/// @param zFrom	z of from position
/// @param xTo		x of to position
/// @param yTo		y of to position
/// @param zTo		z of to position
/// @param xUp		x of up vector
/// @param yUp		y of up vector
/// @param zUp		z of up vector

var m = matrix_build_lookat( argument0, argument1, argument2, 
							 argument3, argument4, argument5,
							 argument6, argument7, argument8 );
//camera_set_view_mat( global.__d3dCamera, m );
//camera_apply( global.__d3dCamera );
camera_set_view_mat( camera_get_active(), m );
camera_apply( camera_get_active() );