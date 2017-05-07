/// @description Insert description here
// You can write your code in this editor

var mat = matrix_build(room_width/2,room_height/2,0, 0,0,get_timer()/100000, 1,1,1);
//The world matrix is what is used to transform drawing within "world" or "object" space.

matrix_set(matrix_world, mat);
//Draw the buffer
vertex_submit(vb_plane, pr_trianglelist, -1);
//Resetting transforms can be done like this:
matrix_set(matrix_world, matrix_build_identity());


