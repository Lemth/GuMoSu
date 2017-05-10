
//To keep things simple, I'll just draw a triangle based pyramid - this should keep roll and direction visible

draw_set_color(c_white);


//Add the matrix to the current world transform
matrix_set(matrix_world, matrix_multiply(moonRotationMatrix,trans_matrix));

//d3d_transform_add_translation(x,y,z);

var s = 128;
var sqs = sqrt(s);

//d3d_set_lighting(false);
d3d_draw_block(-s,-s,-s,s,s,s,-1,0,0);
//d3d_set_lighting(true);



//d3d_transform_set_identity();
matrix_set(matrix_world,matrix_build_identity());



