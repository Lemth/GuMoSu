///@desc z_collision();

var p1 = matrix_transform_vertex(rotation_matrix,argument0,argument4,argument5);
var p2 = matrix_transform_vertex(rotation_matrix,argument3,argument1,argument5);
var p3 = matrix_transform_vertex(rotation_matrix,argument3,argument4,argument2);
collision_state+=m3d_intersect_triangle(pointer_vector,p1[0],p1[1],p1[2],p2[0],p2[1],p2[2],p3[0],p3[1],p3[2]);
var p1 = matrix_transform_vertex(rotation_matrix,argument3,argument1,argument2);
var p2 = matrix_transform_vertex(rotation_matrix,argument0,argument4,argument2);
var p3 = matrix_transform_vertex(rotation_matrix,argument0,argument1,argument5);
collision_state+=m3d_intersect_triangle(pointer_vector,p1[0],p1[1],p1[2],p2[0],p2[1],p2[2],p3[0],p3[1],p3[2]);
