switch (last_input_changed)
{
    case 0: //width
        if (input[0] <= 0)
        {
            show_message("width must be greater than zero");
            input = previous_input;
            input[0] = input[0];
            break;
        }
        event_user(1);
    break;
    case 1: //height
        if (input[1] <= 0)
        {
            show_message("height must be greater than zero");
            input = previous_input;
            input[0] = input[0];
            break;            
        }    
        event_user(1);
    break;
    case 2: //fov
        if (input[2] <= 0) or (input[2] >= 180)
        {
            show_message("fov must be greater than zer and less than 180");
            input = previous_input;
            input[0] = input[0];
            break; 
        }    
        event_user(1);
    break;
    case 3: //znear
        if (input[3] <= 0) or (input[3] >= input[4])
        {
            show_message("znear must be greater than zero and less than zfar");
            input = previous_input;
            input[0] = input[0];
            break; 
        }
        event_user(1);
    break;
    case 4: //zfar
        if (input[4] <= input[3])
        {
            show_message("zfar must be greater than znear");
            input = previous_input;
            input[0] = input[0];
            break; 
        } 
        event_user(1);   
    break;
}

for (var i = 0; i < 5; i++)
{
    with (list_input_cells[|i])
    {
        value = other.input[my_index];
        text = string(value);
    }
}

previous_input = input;
previous_input[0] = previous_input[0];

for (var i = 0; i < 16; i++)
{
    with (list_matrix_cells[|i])
    {
        value = my_parent.matrix[my_index];
        text = string_format(value,1,7);
    }
}


