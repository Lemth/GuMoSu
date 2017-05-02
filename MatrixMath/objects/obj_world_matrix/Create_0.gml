matrix = matrix_build(0,0,0,0,0,0,1,1,1);
previous_matrix = matrix;
list_matrix_cells = ds_list_create();

var _m = 0;
for (var i = 0; i < 4; i++)
    for (var j = 0; j < 4; j++)
    {
        with instance_create(x+72*j,y+24+24*i,obj_text_box_small)
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
    
with instance_create(x,y+120,obj_button_set_identity)
{
    my_parent = other.id;
}
with instance_create(x+144,y+120,obj_button_set_previous)
{
    my_parent = other.id;
}

