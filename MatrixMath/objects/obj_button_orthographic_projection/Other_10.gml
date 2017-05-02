with (obj_button_perspective_projection) { set = false; }
set = true;
with (my_parent)
{

    projection_type = 1;
    event_user(1);
    for (var i = 0; i < 16; i++)
    {
        with (list_matrix_cells[|i])
        {
            value = my_parent.matrix[my_index];
            text = string_format(value,1,7);
        }
    }
}

