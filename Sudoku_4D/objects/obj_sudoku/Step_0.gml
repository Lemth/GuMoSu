if(counter<1000) {

sudoku_create_solution_create_ds();

sudoku_create_solution();

sudoku_create_solution_destroy_ds();

file=file_text_open_append("sudokutimes.txt");
file_text_write_string(file,string(step)+"\n");
file_text_close(file);

counter++;
} else if (counter==1000) {
	show_debug_message(string(get_timer()));
	show_debug_message(string(get_timer()-time));
	counter++;
}
