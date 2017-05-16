var p1 = matrix_transform_vertex(rotation_matrix,argument0,argument4,argument5);
var p2 = matrix_transform_vertex(rotation_matrix,argument3,argument1,argument5);
var p3 = matrix_transform_vertex(rotation_matrix,argument3,argument4,argument2);
var __collision=m3d_intersect_triangle(__vec,p1[0],p1[1],p1[2],p2[0],p2[1],p2[2],p3[0],p3[1],p3[2]);
if(__collision) {
    var __x,__y,__z;
    xx=m3d_projection_collision_get_x(__collision);
    yy=m3d_projection_collision_get_y(__collision);
    zz=m3d_projection_collision_get_z(__collision);
    cc=1;
}
var p1 = matrix_transform_vertex(rotation_matrix,argument3,argument1,argument2);
var p2 = matrix_transform_vertex(rotation_matrix,argument0,argument4,argument2);
var p3 = matrix_transform_vertex(rotation_matrix,argument0,argument1,argument5);
var __collision=m3d_intersect_triangle(__vec,p1[0],p1[1],p1[2],p2[0],p2[1],p2[2],p3[0],p3[1],p3[2]);
if(__collision) {
    var __x,__y,__z;
    xx=m3d_projection_collision_get_x(__collision);
    yy=m3d_projection_collision_get_y(__collision);
    zz=m3d_projection_collision_get_z(__collision);
    cc=1;
}