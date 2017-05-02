my_parent.input[my_index] = 0;
if keyboard_check(my_key)
{
    mouse_down = true;
    image_index = 1;
    my_parent.input[my_index] = 1;
}
else if keyboard_check_released(my_key)
{
    mouse_down = false;
    image_index = 0;
}
if (mouse_released)
{
    mouse_released = false;
    my_parent.input[my_index] = 1;
}



