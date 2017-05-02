if keyboard_check_pressed(vk_insert){ global.insert = !global.insert; }

with (global.focus_object)
{
    pulse += 0.2;
    if keyboard_check_pressed(vk_anykey)
    {
        var _k = keyboard_lastchar;
        switch (ord(_k))
        {
            case ord("0"):
            case ord("1"):
            case ord("2"):
            case ord("3"):
            case ord("4"):
            case ord("5"):
            case ord("6"):
            case ord("7"):
            case ord("8"):
            case ord("9"):
                text += _k;          
            break;
            case ord("."):
                if (string_count(".", text) == 0) { text += _k; }
            break;
            case 8:
                text = string_delete(text,string_length(text),1);
            break;
            case vk_enter:
                event_user(1);
                global.focus_object = noone;
            break;
        }
        if (keyboard_lastkey == vk_subtract)
        {
                if (string_length(text) == 0) { text = "-"; }        
        }
    }
}

