input[13] = 10;
input[12] = 1;

with (instance_create(x+216,y+24,obj_text_box_small))
{
    my_parent = other.id;
    my_index = 12;
    my_data_kind = DATA_TYPE_INPUT;
    value = other.input[12];
    text = string(value);
}
with (instance_create(x+216,y+288,obj_text_box_small))
{
    my_parent = other.id;
    my_index = 13;
    my_data_kind = DATA_TYPE_INPUT;
    value = other.input[13];
    text = string(value);
}


with (instance_create(x+18,y+48+24,obj_button_cam_control))
{
    my_parent = other.id;
    my_index = 0;
    my_key = ord("W");
    sprite_index = spr_pitch_W;
}
with (instance_create(x+198,y+48+24,obj_button_cam_control))
{
    my_parent = other.id;
    my_index = 1;
    my_key = ord("S");
    sprite_index = spr_pitch_S;
}
with (instance_create(x+18,y+120+24,obj_button_cam_control))
{
    my_parent = other.id;
    my_index = 2;
    my_key = ord("A");
    sprite_index = spr_yaw_A;
}
with (instance_create(x+198,y+120+24,obj_button_cam_control))
{
    my_parent = other.id;
    my_index = 3;
    my_key = ord("D");
    sprite_index = spr_yaw_D;
}
with (instance_create(x+18,y+192+24,obj_button_cam_control))
{
    my_parent = other.id;
    my_index = 4;
    my_key = ord("Q");
    sprite_index = spr_roll_Q;
}
with (instance_create(x+198,y+192+24,obj_button_cam_control))
{
    my_parent = other.id;
    my_index = 5;
    my_key = ord("E");
    sprite_index = spr_roll_E;
}

with (instance_create(x,y+264+48,obj_button_cam_control))
{
    my_parent = other.id;
    my_index = 6;
    my_key = ord("U");
    sprite_index = spr_forward_U;
}
with (instance_create(x+144,y+264+48,obj_button_cam_control))
{
    my_parent = other.id;
    my_index = 7;
    my_key = ord("O");
    sprite_index = spr_backward_O;
}
with (instance_create(x,y+288+48,obj_button_cam_control))
{
    my_parent = other.id;
    my_index = 8;
    my_key = ord("J");
    sprite_index = spr_left_J;
}
with (instance_create(x+144,y+288+48,obj_button_cam_control))
{
    my_parent = other.id;
    my_index = 9;
    my_key = ord("L");
    sprite_index = spr_right_L;
}
with (instance_create(x,y+312+48,obj_button_cam_control))
{
    my_parent = other.id;
    my_index = 10;
    my_key = ord("I");
    sprite_index = spr_up_I;
}
with (instance_create(x+144,y+312+48,obj_button_cam_control))
{
    my_parent = other.id;
    my_index = 11;
    my_key = ord("K");
    sprite_index = spr_down_K;
}

