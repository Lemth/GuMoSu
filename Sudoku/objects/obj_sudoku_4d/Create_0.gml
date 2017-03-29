show_debug_message("here");	

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_black);

//file=file_text_open_write("sudokutimes.txt");
//file_text_close(file);

counter=0;

	

// CREATE DATASTRUCTURES							
squares=ds_list_create();							
regions=ds_list_create();							
columns=ds_list_create();							
get_region=ds_list_create();							
get_column1=ds_list_create();							
get_column2=ds_list_create();							
for(var i=0;i<12;i++) {							
	if(i<6) {						
		regions[| i]=ds_list_create();					
	}						
	columns[| i]=ds_list_create();						
}							
for(var i=0;i<96;i++) {							
	squares[| i]=ds_list_create();						
	ds_list_add(squares[| i],1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16);						
	ds_list_shuffle(squares[| i]);						
	var i_region=floor(i/16);						
	ds_list_add(regions[| i_region],i);						
	get_region[| i]=i_region;						
	var i_column1=(floor(i/4) mod 4)+4*floor(i/64);						
	ds_list_add(columns[| i_column1],i);						
	get_column1[| i]=i_column1;						
	var i_column2=abs(15*min(0,floor(i/32)-1) - ((i mod 4)-11)*(floor(i/16) mod 2) + ((i mod 4)+8)*(floor(i/16)+1 mod 2));						
	ds_list_add(columns[| i_column2],i);						
	get_column2[| i]=i_column2;			
		
}							
							
square=0;							
step=0;		
//sudoku_4D();