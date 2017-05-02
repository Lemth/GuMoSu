if (has_focus)
{
    has_focus = false;
    if (text == "")
    { 
        value = old_value; 
        text = string(value);
    }
    else 
    { 
        value = real(text); 
        text = string(value);
        switch(my_data_kind)
        {
            case DATA_TYPE_MATRIX:
                my_parent.matrix[my_index] = value;
                switch(my_parent.object_index)
                {
                    case obj_world_matrix:
                    case obj_view_matrix:
                    case obj_projection_matrix:
                    with (obj_vertex_transform_world) { event_user(0); }
                }
            break;
            case DATA_TYPE_INPUT:
                my_parent.input[my_index] = value;
            break;
        }
        
        if (my_data_kind == DATA_TYPE_INPUT) 
        { 
            if (my_parent.object_index == obj_view_matrix) { my_parent.last_camera_vector_chaged = my_cam_vector; }
            if (my_parent.object_index == obj_projection_matrix) { my_parent.last_input_changed = my_index; }
            with (my_parent) {event_user(0); } 
        }
    }
}

