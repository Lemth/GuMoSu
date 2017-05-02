matrix = matrix_build(0,0,0,0,0,0,1,1,1);
previous_matrix = matrix;

list_matrix_cells = ds_list_create();

var _m = 0;
for (var i = 0; i < 4; i++)
    for (var j = 0; j < 4; j++)
    {
        with instance_create(x+72*j,y+120+24*i,obj_text_box_small)
        {
            value = other.matrix[_m];
            text = string(value);
            my_parent = other.id;
            my_data_kind = DATA_TYPE_MATRIX;
            my_index = _m;
            ds_list_add(other.list_matrix_cells,id);
        }
        _m++;
    }
    
input[8] = 1;
input[7] = 1;
input[6] = 1;
input[5] = 0;
input[4] = 0;
input[3] = 0;
input[2] = 0;
input[1] = 0;
input[0] = 0;
previous_input = input;
previous_input[0] = previous_input[0];
list_input_cells = ds_list_create();
var _m = 0;
for (var i = 0; i < 3; i++)
    for (var j = 0; j < 3; j++)
    {
        with instance_create(x+72+j*72,y+24+i*24,obj_text_box_small)
        {
            value = other.input[_m];
            text = string(value);
            my_parent = other.id;
            my_data_kind = DATA_TYPE_INPUT;
            my_index = _m;
            ds_list_add(other.list_input_cells,id);
        }
       _m++;
    }
    
with instance_create(x,y+216,obj_button_set_identity)
{
    my_parent = other.id;
}
with instance_create(x+144,y+216,obj_button_set_previous)
{
    my_parent = other.id;
}
with instance_create(x,y+264,obj_button_world_mult_transform)
{
    my_parent = other.id;
}
with instance_create(x+144,y+264,obj_button_transform_mult_world)
{
    my_parent = other.id;
}


