//SETUP
//randomize();

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
solve_counter=0;

for(var i=0;i<96;i++) {
    solution[i]=0;
	puzzle[i]=0;
	check[i]=0;
}

test1=0;
test2=0;
time=get_timer()/1000;


test4=[	0,0,0,0,	0,0,14,12,	0,0,0,0,	0,0,4,7,
	0,0,0,0,	0,0,4,13,	0,0,0,0,	0,0,12,8,
	0,0,0,0,	6,1,16,7,	0,0,0,0,	3,5,9,0,
	0,0,0,0,	11,8,5,3,	0,0,0,0,	16,10,1,2,
       
	0,0,0,12,	0,9,2,13,	0,0,0,0,	0,0,6,11,
	0,0,0,0,	0,4,5,3,	0,0,0,0,	0,0,1,8,
	0,0,0,0,	7,12,8,15,	0,0,0,0,	14,4,16,5,
	0,0,0,14,	0,16,10,1,	0,0,0,0,	12,13,7,3,
       
	0,0,0,0,	0,0,3,16,	0,0,0,0,	0,0,7,0,
	0,0,0,0,	0,0,5,10,	0,0,0,0,	9,4,12,16,
	0,0,0,0,	4,12,9,1,	0,0,0,0,	2,5,8,10,
	0,0,0,0,	7,8,0,2,	12,0,0,14,	13,3,15,1];

test5=[	3,11,1,5,	15,9,14,12,	8,2,16,10,	13,6,4,7,
	16,7,6,9,	10,2,4,13,	1,3,11,5,	15,14,12,8,
	8,14,10,2,	6,1,16,7,	12,13,15,4,	3,5,9,11,
	4,12,13,15,	11,8,5,3,	9,7,14,6,	16,10,1,2,
       
	5,1,7,12,	14,9,2,13,	3,16,8,4,	15,10,6,11,
	10,15,13,16,	6,4,5,3,	11,7,14,12,	9,2,1,8,
	2,11,3,9,	7,12,8,15,	1,6,10,13,	14,4,16,5,
	4,8,6,14,	11,16,10,1,	5,9,2,15,	12,13,7,3,
       
	8,1,12,9,	13,15,3,16,	5,10,2,4,	14,6,7,11,
	2,3,13,7,	6,14,5,10,	1,15,11,8,	9,4,12,16,
	16,11,15,14,	4,12,9,1,	7,13,3,6,	2,5,8,10,
	10,5,4,6,	7,8,11,2,	12,16,9,14,	13,3,15,1];

for(var i=0;i<array_length_1d(_order_xy);i++) {
	puzzle[_order_xy[i]]=test4[i];
}

inventory=ds_list_create();
for(var i=0;i<96;i++) {
	inventory[| i]=ds_list_create();
	if(puzzle[i]==0) {
		ds_list_add(inventory[| i],1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16);
	} else {
		ds_list_add(inventory[| i],puzzle[i]);
	}
}
