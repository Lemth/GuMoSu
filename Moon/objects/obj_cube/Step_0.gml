if(mouse_check_button_pressed(mb_left)) {
    mouse_x_prev=window_mouse_get_x();
    mouse_y_prev=window_mouse_get_y();
}
if(mouse_check_button(mb_left)) {
    delta_x=window_mouse_get_x()-mouse_x_prev;
    delta_y=window_mouse_get_y()-mouse_y_prev;
    mouse_x_prev=window_mouse_get_x();
    mouse_y_prev=window_mouse_get_y();
}

//
delta_x=clamp((delta_x+2.5*(keyboard_check(vk_right)-keyboard_check(vk_left)))/1.4,-25,25);
delta_y=clamp((delta_y+2.5*(keyboard_check(vk_up)-keyboard_check(vk_down)))/1.4,-2510,25);


rotation_matrix=matrix_multiply(rotation_matrix,matrix_build(0,0,0, delta_x,delta_y,0, 1,1,1));