//a camera vector has changed
switch (last_camera_vector_chaged)
{
    

    case 0: //from vector
    case 1: //to vector
        
        //look vector
        var _l; 
        
        //from  0  1  2 
        //to    3  4  5
        //up    6  7  8
        //right 9  10 11
        
        _l[Z] = input[5] - input[2];
        _l[Y] = input[4] - input[1];
        _l[X] = input[3] - input[0];
        //normalize look
        _m = sqrt(_l[0]*_l[0]+_l[1]*_l[1]+_l[2]*_l[2]);
        
        if (_m == 0) { 
            show_message("distance between camera from and to vectors can\'t be zero"); 
            input = previous_input;
            input[0] = input[0];
            break; 
        }
        _l[X] /= _m;
        _l[Y] /= _m;
        _l[Z] /= _m;
        
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
        
        //right = up cross look
        var _r;
        _r[Z] = 0;
        _r[X] = _u[Y] * _l[Z] - _u[Z] * _l[Y];
        _r[Y] = _u[Z] * _l[X] - _u[X] * _l[Z];
        _r[Z] = _u[X] * _l[Y] - _u[Y] * _l[X];
        //normalize right
        _m = sqrt(_r[0]*_r[0]+_r[1]*_r[1]+_r[2]*_r[2]);
        _r[X] /= _m;
        _r[Y] /= _m;
        _r[Z] /= _m;        
        
        //Up = look cross right
        _u[X] = _l[Y] * _r[Z] - _l[Z] * _r[Y];
        _u[Y] = _l[Z] * _r[X] - _l[X] * _r[Z];
        _u[Z] = _l[X] * _r[Y] - _l[Y] * _r[X];
        //normalize right
        _m = sqrt(_u[0]*_u[0]+_u[1]*_u[1]+_u[2]*_u[2]);
        _u[X] /= _m;
        _u[Y] /= _m;
        _u[Z] /= _m;   
        
        //from  0  1  2 
        //to    3  4  5
        //up    6  7  8
        //right 9  10 11         
        
        //update up and right vectors
        input[6] = _u[X];
        input[7] = _u[Y];
        input[8] = _u[Z];
        input[9] = _r[X];       
        input[10] = _r[Y];  
        input[11] = _r[Z];  
    
    break;
    case 2: //up vector
    
        //from  0  1  2 
        //to    3  4  5
        //up    6  7  8
        //right 9  10 11
        
        _l[Z] = input[5] - input[2];
        _l[Y] = input[4] - input[1];
        _l[X] = input[3] - input[0];
        //normalize look
        _m = sqrt(_l[0]*_l[0]+_l[1]*_l[1]+_l[2]*_l[2]);
        _l[X] /= _m;
        _l[Y] /= _m;
        _l[Z] /= _m;
        
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
        if (_m == 0) { 
            show_message("up vector can\'t have a length of zero"); 
            input = previous_input;
            input[0] = input[0];
            break; 
        }        
        _u[X] /= _m;
        _u[Y] /= _m;
        _u[Z] /= _m;    
        

        if (abs(dot_product_3d(_l[X],_l[Y],_l[Z],_u[X],_u[Y],_u[Z])) == 1)
        {
            show_message("up vector can\'t point in the same or opposite direction as camera");
            input = previous_input;
            input[0] = input[0];
            break;             
        }
        
        //right = up cross look
        var _r;
        _r[Z] = 0;
        _r[X] = _u[Y] * _l[Z] - _u[Z] * _l[Y];
        _r[Y] = _u[Z] * _l[X] - _u[X] * _l[Z];
        _r[Z] = _u[X] * _l[Y] - _u[Y] * _l[X];
        //normalize right
        _m = sqrt(_r[0]*_r[0]+_r[1]*_r[1]+_r[2]*_r[2]);
        _r[X] /= _m;
        _r[Y] /= _m;
        _r[Z] /= _m;  
        
        //update right vector
        input[9] = _r[X];       
        input[10] = _r[Y];  
        input[11] = _r[Z];       
    
    break;
    case 3: //right vector
        //from  0  1  2 
        //to    3  4  5
        //up    6  7  8
        //right 9  10 11
        
        _l[Z] = input[5] - input[2];
        _l[Y] = input[4] - input[1];
        _l[X] = input[3] - input[0];
        //normalize look
        _m = sqrt(_l[0]*_l[0]+_l[1]*_l[1]+_l[2]*_l[2]);
        _l[X] /= _m;
        _l[Y] /= _m;
        _l[Z] /= _m;
        
        //right vector
        var _r; 

        //from  0  1  2 
        //to    3  4  5
        //up    6  7  8
        //right 9  10 11        
        
        _r[Z] = input[11];
        _r[Y] = input[10];
        _r[X] = input[9];
        //normalize look
        _m = sqrt(_r[0]*_r[0]+_r[1]*_r[1]+_r[2]*_r[2]);
        if (_m == 0) { 
            show_message("right vector can\'t have a length of zero"); 
            input = previous_input;
            input[0] = input[0];
            break; 
        }          
        _r[X] /= _m;
        _r[Y] /= _m;
        _r[Z] /= _m;   
        
        if (abs(dot_product_3d(_l[X],_l[Y],_l[Z],_r[X],_r[Y],_r[Z])) == 1)
        {
            show_message("right vector can\'t point in the same or opposite direction as camera");
            input = previous_input;
            input[0] = input[0];
            break;             
        }        
        
        //Up = look cross right
        _u[X] = _l[Y] * _r[Z] - _l[Z] * _r[Y];
        _u[Y] = _l[Z] * _r[X] - _l[X] * _r[Z];
        _u[Z] = _l[X] * _r[Y] - _l[Y] * _r[X];
        //normalize right
        _m = sqrt(_u[0]*_u[0]+_u[1]*_u[1]+_u[2]*_u[2]);
        _u[X] /= _m;
        _u[Y] /= _m;
        _u[Z] /= _m;  
        
        //update up vector
        input[6] = _u[X];
        input[7] = _u[Y];
        input[8] = _u[Z];                         
        
    break;
}



for (var i = 0; i < 12; i++)
{
    with (list_input_cells[|i])
    {
        value = other.input[my_index];
        text = string(value);
    }
}

previous_input = input;
previous_input[0] = previous_input[0];

event_user(1);

with (obj_vertex_transform_world) { event_user(0); };


