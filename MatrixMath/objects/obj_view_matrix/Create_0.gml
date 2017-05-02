


last_camera_vector_chaged = 0;

//right
input[9] = -1; input[10] = 0; input[11] = 0;

//up
input[6] = 0; input[7] = 0; input[8] = 1;

//to
input[3] = 0; input[4] = 0; input[5] = 0;

//from
input[0] = 0; input[1] = -400; input[2] = 0;

previous_input = input;
previous_input[0] = previous_input[0];

list_input_cells = ds_list_create();
var _m = 0;
for (var i = 0; i < 4; i++)
    for (var j = 0; j < 3; j++)
    {
        with instance_create(x+72+j*72,y+24+i*24,obj_text_box_small)
        {
            value = other.input[_m];
            text = string(value);
            my_parent = other.id;
            my_data_kind = DATA_TYPE_INPUT;
            my_index = _m;
            my_cam_vector = i;
            ds_list_add(other.list_input_cells,id);
        }
       _m++;
    }
    
matrix[15] = 0;

previous_matrix = matrix;
previous_matrix[0] = previous_matrix[0];

list_matrix_cells = ds_list_create();

var _m = 0;
for (var i = 0; i < 4; i++)
    for (var j = 0; j < 4; j++)
    {
        with instance_create(x+72*j,y+144+24*i,obj_text_box_small)
        {
            value = 0;
            text = "";
            my_parent = other.id;
            my_data_kind = DATA_TYPE_MATRIX;
            my_index = _m;
            ds_list_add(other.list_matrix_cells,id);
        }
        _m++;
    }
    
event_user(1);

with (instance_create(x,y+264,obj_button_move_cam_to_top))
{
    my_parent = other.id;
}
with (instance_create(x+144,y+264,obj_button_move_cam_to_bottom))
{
    my_parent = other.id;
}
with (instance_create(x,y+288,obj_button_move_cam_to_front))
{
    my_parent = other.id;
}
with (instance_create(x+144,y+288,obj_button_move_cam_to_back))
{
    my_parent = other.id;
}
with (instance_create(x,y+312,obj_button_move_cam_to_left))
{
    my_parent = other.id;
}
with (instance_create(x+144,y+312,obj_button_move_cam_to_right))
{
    my_parent = other.id;
}

