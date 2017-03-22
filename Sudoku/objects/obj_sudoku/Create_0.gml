draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_black);

file=file_text_open_write("sudokutimes.txt");
file_text_close(file);

counter=0;

sudoku();