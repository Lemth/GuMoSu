/// @desc sudoku()
time=get_timer()/1000;
file=file_text_open_append("sudokutimes.txt");

sudoku_4D_create_solution();

//file_text_write_string(file,string(get_timer()/1000-time)+"	 "); //#A
//time=get_timer()/1000;
//
//sudoku_create_puzzle();

file_text_write_string(file,string(get_timer()/1000-time)+"\n"); //#B

file_text_close(file);
counter++;