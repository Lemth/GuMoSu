

with (my_parent)
{
    matrix = matrix_build(0,0,0,0,0,0,1,1,1);
    for (var i = 0; i < 16; i++)
    {
        with (list_matrix_cells[|i])
        {
            value = other.matrix[my_index];
            text = string(value);
        }
    }
    if (object_index == obj_transform_matrix)
    {
        input[0] = 0;
        input[1] = 0;
        input[2] = 0;
        input[3] = 0;
        input[4] = 0;
        input[5] = 0;
        input[6] = 1;
        input[7] = 1;
        input[8] = 1;
        for (var i = 0; i < 9; i++)
        {
            with (list_input_cells[|i])
            {
                value = other.input[my_index];
                text = string(value);
            }
        }        
        
    }
    if (object_index == obj_world_matrix)
    {
        with (obj_vertex_transform_world) { event_user(0); };
    }
}

