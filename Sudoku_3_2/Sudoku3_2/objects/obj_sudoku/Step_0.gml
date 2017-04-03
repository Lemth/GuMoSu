if(counter<10) {

    time=get_timer()/1000;

    sudoku();
    
    file=file_text_open_append("sudokutimes.txt");
    file_text_write_real(file,(get_timer()/1000)-time);
    file_text_close(file);
    
    counter++;
}

