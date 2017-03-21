	
time=get_timer()/1000;

yt_sudoku();

timer=get_timer()/1000-time;
file=file_text_open_append("sudokutimes.txt");
file_text_write_string(file,string(timer)+"\n");
file_text_close(file);