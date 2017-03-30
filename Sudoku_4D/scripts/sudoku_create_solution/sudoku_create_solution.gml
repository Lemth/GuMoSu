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

var square=0;
var step=0;
while(square<96) {
	//START
	step++;
	if(step>1000000) { //Safety net (at 4th STD DEV)
		for(var i=0;i<81;i++) {
			ds_list_clear(squares[| i]);
			ds_list_add(squares[| i],1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16);
			ds_list_shuffle(squares[| i]);
		}
		square=0;
		step=0;
		continue;
	}
	//Get a number randomly from the available numbers
	solution[square]=ds_list_find_value(squares[| square],0);
	//Are we out of Numbers?
	if(is_undefined(solution[square])) {
		//Replenish this squares numbers and go back 1 square
		ds_list_add(squares[| square],1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16);
		ds_list_shuffle(squares[| square]);
		square--;
		continue;
	}
	//Use it!
	ds_list_delete(squares[| square],0);
	//Does it Conflict?
	if(sudoku_create_solution_check_conflict(square)) {
		//Remove from available numbers for this square
		continue;
	}
	square++;
}

// CLEANUP DATASTRUCTURES
for(var i=0;i<96;i++) {
	if(i<12) {
		if (i<6) {
			ds_list_destroy(regions[| i]);
		}
		ds_list_destroy(columns[| i]);
	}
	ds_list_destroy(squares[| i]);
}
ds_list_destroy(get_column2);
ds_list_destroy(get_column1);
ds_list_destroy(get_region);
ds_list_destroy(columns);
ds_list_destroy(regions);
ds_list_destroy(squares);