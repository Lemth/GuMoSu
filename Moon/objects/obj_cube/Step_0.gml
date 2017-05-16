if(mouse_check_button_pressed(mb_left)) {
    mouse_x_prev=window_mouse_get_x();
    mouse_y_prev=window_mouse_get_y();
}
if(mouse_check_button(mb_left)) {
    delta_x=window_mouse_get_x()-mouse_x_prev;
    delta_y=mouse_y_prev-window_mouse_get_y();
    mouse_x_prev=window_mouse_get_x();
    mouse_y_prev=window_mouse_get_y();
}

delta_x=clamp((delta_x+2.5*(keyboard_check(vk_right)-keyboard_check(vk_left)))/1.4,-25,25);
delta_y=clamp((delta_y+2.5*(keyboard_check(vk_up)-keyboard_check(vk_down)))/1.4,-2510,25);

rotation_matrix=matrix_multiply(rotation_matrix,matrix_build(0,0,0, delta_y,delta_x,0, 1,1,1));



pointer_vector=m3d_projection_calculate();

order=ds_grid_create(7,6);
order_count=0;
z_check(-1,1,1,-1,-1,-1);
z_check(-1,-1,1,1,-1,-1);
z_check(-1,1,-1,1,-1,-1);
z_check(1,-1,1,1,1,-1);
z_check(1,1,1,-1,1,-1);
z_check(1,1,1,-1,-1,1);
ds_grid_sort(order,6,true);
for(var i=0;i<6;i++) {
    if(order[# 6,i]>0) {
        z_collision(order[# 0,i],order[# 1,i],order[# 2,i],order[# 3,i],order[# 4,i],order[# 5,i]);
    }
}
ds_grid_destroy(order);