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


scr_puzzle_prime();



pointer_vector[2]=0;
collision_vector[2]=0;
collision_state=false;
selection_vector[2]=0;
hover_square=-1;
selected_square=-1;


puzzle[0]="ADCB8420F53E61972CB918E456DA730F76E8A5B149CDF0324BAD0281E76C39F5CA569042BF73DE1841209FD3B7A6E8C5";
puzzle[1]="A.C.84.0....6....CB.1..4.6.A7.0.7......1.9C...3....D..8.E...39.5..5....2.F73...84....F....A6E..5";
puzzle[2]="A.C.84.0....6....CB.1..4.6.A7.0.7......1.9C...3....D..8.E...39.5..5....2.F73...84....F....A6E..5";
//puzzle/="A.C.84.0....6....CB.1..4.6.A7.0.7......1.9C...3....D..8.E...39.5..5....2.F73...84....F....A6E..5";
//puzzle/="ADCB8420F.3E61972CB918E456DA730F76E8.5B149CDF0324B.D0281E76C39F5CA56.042BF73DE1841209FD.B7A6E8C5";
puzzle=scr_puzzle_count(puzzle,80);
puzzle=scr_puzzle_shuffle(puzzle);
//puzzle=scr_puzzle_limit(puzzle,9);



vertex_prime_cube();
vertex_build_cube();


vertex_format_begin();
vertex_format_add_position_3d();
vertex_format_add_colour();
VF=vertex_format_end();	
crosshair=vertex_create_buffer();
