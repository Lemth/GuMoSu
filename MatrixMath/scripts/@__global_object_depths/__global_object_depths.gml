// Initialise the global array that allows the lookup of the depth of a given object
// GM2.0 does not have a depth on objects so on import from 1.x a global array is created
// NOTE: MacroExpansion is used to insert the array initialisation at import time
gml_pragma( "global", "__global_object_depths()");

// insert the generated arrays here
global.__objectDepths[0] = 0; // obj_world_matrix
global.__objectDepths[1] = 0; // obj_master
global.__objectDepths[2] = 0; // obj_transform_matrix
global.__objectDepths[3] = 0; // obj_vertex_transform_world
global.__objectDepths[4] = 0; // obj_cam_controls
global.__objectDepths[5] = 0; // obj_projection_matrix
global.__objectDepths[6] = -1; // obj_text_box
global.__objectDepths[7] = -1; // obj_text_out
global.__objectDepths[8] = -1; // obj_text_out_small
global.__objectDepths[9] = -1; // obj_text_box_small
global.__objectDepths[10] = -1; // obj_button
global.__objectDepths[11] = -1; // obj_button_set_previous
global.__objectDepths[12] = -1; // obj_button_world_mult_transform
global.__objectDepths[13] = -1; // obj_button_set_identity
global.__objectDepths[14] = -1; // obj_button_transform_mult_world
global.__objectDepths[15] = 0; // obj_view_matrix
global.__objectDepths[16] = -1; // obj_button_vertex_world_transform
global.__objectDepths[17] = -1; // obj_button_world_vertex_transform
global.__objectDepths[18] = -1; // obj_button_move_cam_to_top
global.__objectDepths[19] = -1; // obj_button_move_cam_to_bottom
global.__objectDepths[20] = -1; // obj_button_move_cam_to_front
global.__objectDepths[21] = -1; // obj_button_move_cam_to_back
global.__objectDepths[22] = -1; // obj_button_move_cam_to_left
global.__objectDepths[23] = -1; // obj_button_move_cam_to_right
global.__objectDepths[24] = -1; // obj_button_cam_control
global.__objectDepths[25] = -1; // obj_button_perspective_projection
global.__objectDepths[26] = -1; // obj_button_orthographic_projection


global.__objectNames[0] = "obj_world_matrix";
global.__objectNames[1] = "obj_master";
global.__objectNames[2] = "obj_transform_matrix";
global.__objectNames[3] = "obj_vertex_transform_world";
global.__objectNames[4] = "obj_cam_controls";
global.__objectNames[5] = "obj_projection_matrix";
global.__objectNames[6] = "obj_text_box";
global.__objectNames[7] = "obj_text_out";
global.__objectNames[8] = "obj_text_out_small";
global.__objectNames[9] = "obj_text_box_small";
global.__objectNames[10] = "obj_button";
global.__objectNames[11] = "obj_button_set_previous";
global.__objectNames[12] = "obj_button_world_mult_transform";
global.__objectNames[13] = "obj_button_set_identity";
global.__objectNames[14] = "obj_button_transform_mult_world";
global.__objectNames[15] = "obj_view_matrix";
global.__objectNames[16] = "obj_button_vertex_world_transform";
global.__objectNames[17] = "obj_button_world_vertex_transform";
global.__objectNames[18] = "obj_button_move_cam_to_top";
global.__objectNames[19] = "obj_button_move_cam_to_bottom";
global.__objectNames[20] = "obj_button_move_cam_to_front";
global.__objectNames[21] = "obj_button_move_cam_to_back";
global.__objectNames[22] = "obj_button_move_cam_to_left";
global.__objectNames[23] = "obj_button_move_cam_to_right";
global.__objectNames[24] = "obj_button_cam_control";
global.__objectNames[25] = "obj_button_perspective_projection";
global.__objectNames[26] = "obj_button_orthographic_projection";


// create another array that has the correct entries
var len = array_length_1d(global.__objectDepths);
global.__objectID2Depth = [];
for( var i=0; i<len; ++i ) {
	var objID = asset_get_index( global.__objectNames[i] );
	if (objID >= 0) {
		global.__objectID2Depth[ objID ] = global.__objectDepths[i];
	} // end if
} // end for