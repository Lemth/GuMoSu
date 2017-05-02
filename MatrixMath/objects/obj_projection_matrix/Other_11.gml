//calculate projection matrix
if (projection_type)
{
    //orthographic
    matrix[0] = 2 / input[0];
    matrix[1] = 0;
    matrix[2] = 0;
    matrix[3] = 0;
    matrix[4] = 0;
    matrix[5] = -2 / input[1];
    matrix[6] = 0;
    matrix[7] = 0;
    matrix[8] = 0;
    matrix[9] = 0;
    matrix[10] = 1 / (input[4] - input[3]);
    matrix[11] = 0;
    matrix[12] = -1 / input[0];
    matrix[13] = 1 / input[1];
    matrix[14] = -1 / (input[4] - input[3]);;
    matrix[15] = 1;
}
else
{
    //perspective
    //0  1  2  3 
    //4  5  6  7
    //8  9  10 11
    //12 13 14 15
    
    var _tan = dtan(input[2]/2);
    
    matrix[0] = 1 / _tan * input[1] / input[0];
    matrix[1] = 0;
    matrix[2] = 0;
    matrix[3] = 0;
    matrix[4] = 0;
    matrix[5] = 1 / _tan;
    matrix[6] = 0;
    matrix[7] = 0;
    matrix[8] = 0;
    matrix[9] = 0;
    matrix[10] = input[4] / (input[4] - input[3]);
    matrix[11] = 1;
    matrix[12] = -1 / input[0];
    matrix[13] = 1 / input[1];
    matrix[14] = (input[4] * input[3]) / (input[3] - input[4]);
    matrix[15] = 0;
    
}

//update vertex transforms
with (obj_vertex_transform_world) { event_user(0); }

