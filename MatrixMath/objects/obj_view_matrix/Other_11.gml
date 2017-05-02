
//GENERATE view matrix;
matrix[15] = 1;
matrix[3] = 0;
matrix[7] = 0;
matrix[11] = 0;

        //from  0  1  2 
        //to    3  4  5
        //up    6  7  8
        //right 9  10 11

//cam "look" vector
matrix[2] = input[3] - input[0];
matrix[6] = input[4] - input[1];
matrix[10] = input[5] - input[2];

//magnitude of "look"
var _m;
_m = sqrt(matrix[2]*matrix[2]+matrix[6]*matrix[6]+matrix[10]*matrix[10]);
//normalize "look"
matrix[2] /= _m;
matrix[6] /= _m;
matrix[10] /= _m;

//up vector
var _u; 

//from  0  1  2 
//to    3  4  5
//up    6  7  8
//right 9  10 11        

_u[Z] = input[8];
_u[Y] = input[7];
_u[X] = input[6];
//normalize look
_m = sqrt(_u[0]*_u[0]+_u[1]*_u[1]+_u[2]*_u[2]);
_u[X] /= _m;
_u[Y] /= _m;
_u[Z] /= _m;  

//cam "right" vector = cross "up" and "look"
//WARNING:  assuming "_u" is normalized
matrix[0] = _u[Y] * matrix[10] - _u[Z] * matrix[6];
matrix[4] = _u[Z] * matrix[2] - _u[X] * matrix[10];
matrix[8] = _u[X] * matrix[6] - _u[Y] * matrix[2];
//magnitude of "right"
_m = sqrt(matrix[0]*matrix[0]+matrix[4]*matrix[4]+matrix[8]*matrix[8]);
//normalize "right"
matrix[0] /= _m;
matrix[4] /= _m;
matrix[8] /= _m;



//cam "up" vector = cross "look" and "right"
matrix[1] = matrix[6] * matrix[8] - matrix[10] * matrix[4];
matrix[5] = matrix[10] * matrix[0] - matrix[2] * matrix[8];
matrix[9] = matrix[2] * matrix[4] - matrix[6] * matrix[0];

        //from  0  1  2 
        //to    3  4  5
        //up    6  7  8
        //right 9  10 11

//rotate "cam from"
matrix[12] = -input[0] * matrix[0] - input[1] * matrix[4] - input[2] * matrix[8];
matrix[13] = -input[0] * matrix[1] - input[1] * matrix[5] - input[2] * matrix[9];
matrix[14] = -input[0] * matrix[2] - input[1] * matrix[6] - input[2] * matrix[10];

for (var i = 0; i < 16; i++)
{
    with (list_matrix_cells[|i])
    {
        value = my_parent.matrix[my_index];
        text = string(value);
    }
}




