with (my_parent)
{
    //from  0 1 2
    //to    3 4 5
    //up    6 7 8
    //right 9 10 11
    if (obj_projection_matrix.projection_type == 0) {
        input[0] = 0;
        input[1] = -400;
        input[2] = 0;
        
        input[3] = 0;
        input[4] = 0;
        input[5] = 0;
        
        input[6] = 0;
        input[7] = 0;
        input[8] = 1;
        
        input[9] = -1;
        input[10] = 0;
        input[11] = 0; 
    } else {
        input[0] = 0;
        input[1] = 400;
        input[2] = 0;
        
        input[3] = 0;
        input[4] = 0;
        input[5] = 0;
        
        input[6] = 0;
        input[7] = 0;
        input[8] = -1;
        
        input[9] = -1;
        input[10] = 0;
        input[11] = 0;     
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
}

