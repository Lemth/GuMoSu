obj_world_matrix.previous_matrix = obj_world_matrix.matrix;
obj_transform_matrix.previous_matrix = obj_transform_matrix.matrix;
obj_world_matrix.matrix = matrix_multiply(obj_world_matrix.matrix,obj_transform_matrix.matrix);
obj_transform_matrix.previous_input = obj_transform_matrix.input;
obj_transform_matrix.previous_input[0] = obj_transform_matrix.previous_input[0];
with (obj_world_matrix)
{
    for (var i = 0; i < 16; i++)
    {
        with (list_matrix_cells[|i])
        {
            value = other.matrix[my_index];
            text = string(value);
        }
    }
}

with (obj_vertex_transform_world) { event_user(0); };

