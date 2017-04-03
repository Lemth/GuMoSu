var numbers=0;
//if (mouse_check_button(mb_right)) {
if(1==1) {
    for(i=0;i<12;i++) {
        for(j=0;j<16;j++) {
            var block=loopback[16*i+j];
//            if(block<96) {
                if(solution[block]>0) {
                    numbers++;
                    draw_text(room_width*(i+1)/13,room_height*(j+1)/17,string_hash_to_newline(string(solution[block])));
  /*              }
            } else {
                if(solution[loopback[block-96]]>0) {
                    draw_set_color(c_gray);
                    draw_text(room_width*(i+1)/13,room_height*(j+1)/17,string(solution[loopback[block-96]]));
                    draw_set_color(c_black);
                }
    */        }
        }
    }
}
draw_text(room_width/2,room_height*16.75/17,string_hash_to_newline("Numbers: "+string(numbers)));
draw_text(room_width/2,room_height*0.25/17,string_hash_to_newline("Steps: "+string(step)));

/* */
/*  */
