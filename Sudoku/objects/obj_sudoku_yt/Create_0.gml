draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_black);

globalvar unsolved;
unsolved=81;

counter=0;

time=get_timer()/1000;

yt_sudoku();

timer=get_timer()/1000-time;
file=file_text_open_write("sudokutimes.txt");
file_text_write_string(file,string(timer)+"\n");
file_text_close(file);
counter++;



