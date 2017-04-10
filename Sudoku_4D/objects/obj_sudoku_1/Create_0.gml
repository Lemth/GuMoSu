//SETUP
randomize();

//TEXT
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_black);

//OUTPUT
file=file_text_open_write("sudokutimes.txt");
file_text_close(file);

//HARDCODED DATA
sdk_initialize();

//INIT VARIABLES
counter=0;
square=0;
step=0;

for(var i=0;i<96;i++) {
    solution[i]=0;
	puzzle[i]=0;
	check[i]=0;
}

test1=0;
test2=0;
test3=0;
time=get_timer()/1000;