with (my_parent)
{
    matrix = previous_matrix;
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
        input = previous_input; 
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

