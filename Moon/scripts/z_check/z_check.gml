var p1 = matrix_transform_vertex(rotation_matrix,argument0,argument1,argument2);
var p2 = matrix_transform_vertex(rotation_matrix,argument3,argument4,argument5);
if((p1[2]+p2[2])/2>0) {
    ds_grid_add(order,6,order_count,(p1[2]+p2[2])/2);
    ds_grid_add(order,0,order_count,argument0);
    ds_grid_add(order,1,order_count,argument1);
    ds_grid_add(order,2,order_count,argument2);
    ds_grid_add(order,3,order_count,argument3);
    ds_grid_add(order,4,order_count,argument4);
    ds_grid_add(order,5,order_count,argument5);
    order_count++;
}