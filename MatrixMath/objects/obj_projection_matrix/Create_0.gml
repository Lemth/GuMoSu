projection_type = 0; //0 = perspective, 1 = orthographic
last_input_changed = 0;

matrix[15] = 0;
list_matrix_cells = ds_list_create();

input[4] = 32000; //zfar
input[3] = 1; //znear
input[2] = 60; //fov
input[1] = 400; //height
input[0] = 500; //width

previous_input = input;
previous_input[0] = previous_input[0];

event_user(1);

list_input_cells = ds_list_create();
var _m = 0;
for (var i = 0; i < 5; i++)
    with instance_create(x+216,y+24+i*24,obj_text_box_small)
    {
        value = other.input[_m];
        text = string(value);
        my_parent = other.id;
        my_data_kind = DATA_TYPE_INPUT;
        my_index = _m;
        ds_list_add(other.list_input_cells,id);
       _m++;
    }


var _m = 0;
for (var i = 0; i < 4; i++)
    for (var j = 0; j < 4; j++)
    {
        with instance_create(x+72*j,y+192+24*i,obj_text_box_small)
        {
            value = other.matrix[_m];
            text = string_format(value,1,7);
            my_parent = other.id;
            my_data_kind = DATA_TYPE_MATRIX;
            my_index = _m;
            ds_list_add(other.list_matrix_cells,id);
        }
        _m++;
    }
    
with (instance_create(x,y+144,obj_button_perspective_projection))
{ my_parent = other.id; set = true;}

with (instance_create(x+144,y+144,obj_button_orthographic_projection))
{ my_parent = other.id; set = false; }


