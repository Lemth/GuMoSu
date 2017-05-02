var _rot_x = (input[1] - input[0]) * input[12];
var _rot_y = (input[3] - input[2]) * input[12];
var _rot_z = (input[4] - input[5]) * input[12];

var _move_z = (input[6] - input[7]) * input[13];
var _move_x = (input[9] - input[8]) * input[13];
var _move_y = (input[10] - input[11]) * input[13];


if ((_rot_x != 0) or (_rot_y != 0) or (_rot_z != 0) or (_move_y != 0) or (_move_x != 0) or (_move_z != 0))
{
    var _m1 = obj_view_matrix.matrix;
    
    var _cam_x = input[0];
    var _cam_y = input[1];
    var _cam_z = input[2];
    _m1[12] = 0;
    _m1[13] = 0;
    _m1[14] = 0;
    
    var _m2 = matrix_multiply(_m1,matrix_build(0,0,0,_rot_x,_rot_y,_rot_z,1,1,1));
    
    with (obj_view_matrix)
    {
        matrix = _m2;
        var _look_dist = point_distance_3d(input[0],input[1],input[2],input[3],input[4],input[5]);
        
        //calculate new from vector
        input[0] += _move_x * matrix[0] + _move_y * matrix[1] + _move_z * matrix[2];
        input[1] += _move_x * matrix[4] + _move_y * matrix[5] + _move_z * matrix[6];
        input[2] += _move_x * matrix[8] + _move_y * matrix[9] + _move_z * matrix[10];
        //calculate new to fector
        input[3] = input[0] + matrix[2] * _look_dist;
        input[4] = input[1] + matrix[6] * _look_dist;
        input[5] = input[2] + matrix[10] * _look_dist;
        //set up vector
        input[6] = matrix[1];
        input[7] = matrix[5];
        input[8] = matrix[9];
        //set right vector
        input[9] = matrix[0]
        input[10] = matrix[4];
        input[11] = matrix[8];
        //rotate from vector                
        matrix[12] = -input[0] * matrix[0] - input[1] * matrix[4] - input[2] * matrix[8];
        matrix[13] = -input[0] * matrix[1] - input[1] * matrix[5] - input[2] * matrix[9];
        matrix[14] = -input[0] * matrix[2] - input[1] * matrix[6] - input[2] * matrix[10];
        
        //update input text boxes
        for (var i = 0; i < 12; i++)
        {
            with (list_input_cells[|i])
            {
                value = other.input[my_index];
                text = string(value);
            }
        }

        //update matrix cell boxes
        for (var i = 0; i < 16; i++)
        {
            with (list_matrix_cells[|i])
            {
                value = my_parent.matrix[my_index];
                text = string(value);
            }
        }
        
        //this becomes previous input    
        previous_input = input;
        previous_input[0] = previous_input[0];
        
        with (obj_vertex_transform_world) { event_user(0); };
        

    }
    
}

