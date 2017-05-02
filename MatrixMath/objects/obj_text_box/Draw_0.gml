//draw_self();
if (has_focus) 
{ 
    var _p = sin(pulse);
    draw_sprite_ext(spr_pixel,0,x,y,sprite_width,sprite_height,0,$FFCCCC,_p*0.5+0.5); 
    draw_text(tx,ty,string_hash_to_newline(text));
    if (_p > 0) { draw_text(tx + string_width(string_hash_to_newline(text))/2 + 4,ty,string_hash_to_newline("|")); } 
}
else
{ draw_text(tx,ty,string_hash_to_newline(text)); }

