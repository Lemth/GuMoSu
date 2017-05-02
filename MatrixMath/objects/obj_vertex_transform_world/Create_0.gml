multiplication_order = 1;
vertex_in_view = false;

input[3] = 1;
input[2] = 0;
input[1] = 0;
input[0] = 0;
for (var i = 0; i < 4; i++)
{
    with instance_create(x+72*i,y+48,obj_text_box_small)
    {
        value = other.input[i];
        text = string(value);
        my_parent = other.id;
        my_data_kind = DATA_TYPE_INPUT;
        my_index = i;
    }
}

output[17] = 0;



list_output_cells = ds_list_create();
for (var i = 0; i < 4; i++)
{
    with instance_create(x+72*i,y+120,obj_text_out_small)
    {
        value = other.output[i];
        text = string(value);
        ds_list_add(other.list_output_cells,id);
    }
}
for (var i = 0; i < 4; i++)
{
    with instance_create(x+72*i,y+168,obj_text_out_small)
    {
        value = other.output[4+i];
        text = string(value);
        ds_list_add(other.list_output_cells,id);
    }
}
for (var i = 0; i < 4; i++)
{
    with instance_create(x+72*i,y+216,obj_text_out_small)
    {
        value = other.output[8+i];
        text = string(value);
        ds_list_add(other.list_output_cells,id);
    }
}
for (var i = 0; i < 4; i++)
{
    with instance_create(x+72*i,y+264,obj_text_out_small)
    {
        value = other.output[12+i];
        text = string(value);
        ds_list_add(other.list_output_cells,id);
    }
}
for (var i = 0; i < 2; i++)
{
    with instance_create(x+72*i,y+312,obj_text_out_small)
    {
        value = other.output[16+i];
        text = string(value);
        ds_list_add(other.list_output_cells,id);
    }
}

with (instance_create(x,y+96,obj_button_vertex_world_transform))
{
    my_parent = other.id;
    set = true;
}

with (instance_create(x+144,y+96,obj_button_world_vertex_transform))
{
    my_parent = other.id;
    set = false;
}


