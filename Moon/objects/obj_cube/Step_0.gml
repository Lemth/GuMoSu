if(mouse_check_button_pressed(mb_left)) {
    mouse_x_prev=window_mouse_get_x();
    mouse_y_prev=window_mouse_get_y();
	selected_square=hover_square;
}
if(mouse_check_button(mb_left)) {
    delta_x=window_mouse_get_x()-mouse_x_prev;
    delta_y=mouse_y_prev-window_mouse_get_y();
    mouse_x_prev=window_mouse_get_x();
    mouse_y_prev=window_mouse_get_y();
}
if(selected_square>=0) {
	if(keyboard_check_pressed(vk_anykey)) {
		switch(ord(keyboard_lastchar)) {
			case ord("0"):
			case ord("1"):
			case ord("2"):
			case ord("3"):
			case ord("4"):
			case ord("5"):
			case ord("6"):
			case ord("7"):
			case ord("8"):
			case ord("9"):
			case ord("A"):
			case ord("B"):
			case ord("C"):
			case ord("D"):
			case ord("E"):
			case ord("F"):
			case ord("a"):
			case ord("b"):
			case ord("c"):
			case ord("d"):
			case ord("e"):
			case ord("f"):
				puzzle[2]=string_set_byte_at(puzzle[2],selected_square+1,ord(string_upper(keyboard_lastchar)));
				keyboard_lastchar="";
				selected_square=-1;
				break;
			case ord("-"):
			case ord("."):
				puzzle[2]=string_set_byte_at(puzzle[2],selected_square+1,ord("."));
			default:
				keyboard_lastchar="";
				selected_square=-1;
				break;
		}
	}
}
if(puzzle[0]==puzzle[2]) {
	show_message("WE DID IT!");
	puzzle[0]="";
}

delta_x=clamp((delta_x+2.5*(keyboard_check(vk_right)-keyboard_check(vk_left)))/1.4,-25,25);
delta_y=clamp((delta_y+2.5*(keyboard_check(vk_up)-keyboard_check(vk_down)))/1.4,-2510,25);

rotation_matrix=matrix_multiply(rotation_matrix,matrix_build(0,0,0, delta_y,delta_x,0, 1,1,1));

pointer_vector=m3d_projection_calculate();

order=ds_grid_create(7,6);
order_count=0;
z_check(-1,-1,-1, 1,1,-1);
z_check(1,-1,1, -1,-1,-1);
z_check( -1,-1,1, -1,1,-1);
z_check(-1,1,1, 1,-1,1);
z_check(1,1,-1, -1,1,1);
z_check(1,-1,-1, 1,1,1);
ds_grid_sort(order,6,false);
collision_state=false;
for(var i=0;i<6;i++) {
    if(order[# 6,i]<0) {
        z_collision(order[# 0,i],order[# 1,i],order[# 2,i],order[# 3,i],order[# 4,i],order[# 5,i]);
    }
}
ds_grid_destroy(order);
if(collision_state) {
	selection_vector=matrix_transform_vertex(matrix_transpose(rotation_matrix),collision_vector[0],collision_vector[1],collision_vector[2]);
} else {
	selection_vector=[0,0,0];
	hover_square=-1;
}

vertex_build_cube();