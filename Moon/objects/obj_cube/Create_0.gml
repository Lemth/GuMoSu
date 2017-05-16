rotation_matrix=matrix_build_identity(); // identity
//rotateMatrix=matrix_multiply(rotateMatrix,matrix_build(0,0,0, 0,-45,0, 1,1,1));
delta_x=0;
delta_y=0;
mouse_x_prev=window_mouse_get_x();
mouse_y_prev=window_mouse_get_y();

for(var i=0;i<96;i++) {
	puzzle[i]=irandom(16);
}
colors=[c_red,c_orange,c_yellow,c_green,c_blue,c_purple];
counter=0;

vertex_cube();