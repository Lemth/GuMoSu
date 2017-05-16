rotation_matrix=matrix_build_identity();
//rotation_matrix=matrix_multiply(rotation_matrix,matrix_build(0,0,0, 0,-90,0, 1,1,1));
delta_x=0;
delta_y=0;
mouse_x_prev=0;
mouse_y_prev=0;

for(var i=0;i<96;i++) {	puzzle[i]=irandom(15); }
for(var i=0;i<96;i++) {	solution[i]=irandom(15); }
for(var i=0;i<96;i++) {	status[i]=choose(0,0,0,0,1,8,-1,0); }
colors=[c_red,c_orange,c_yellow,c_green,c_blue,c_purple];

cube_texture=sprite_get_texture(spr_numbers,0);
vertex_prime_cube();
vertex_build_cube();






pointer_vector=[0,0,0];
collision_vector=[0,0,0];
collision_state=false;
selection_vector=[0,0,0];
selected_square=-1;