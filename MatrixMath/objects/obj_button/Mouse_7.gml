if (mouse_down)
{
    with (global.focus_object) { has_focus = false; text = string(value); }
    global.focus_object = noone;

    mouse_down = false;
    image_index = 0;
    event_user(0);
    
    
}

