if(counter<100) {

// INIT
ds_list_shuffle(_values);


// CREATE DATASTRUCTURES
square=ds_list_create();
xx=ds_list_create();
yy=ds_list_create();
zz=ds_list_create();
var backup=ds_list_create();
for(var i=0;i<6;i++) {
    xx[| i]=ds_list_create();
    yy[| i]=ds_list_create();
    zz[| i]=ds_list_create();
}
for(var i=0;i<96;i++) {
	solution[i]=0;
	square[| i]=ds_map_create();
    ds_map_add(square[| i],"xx",xx[| _value_x[i]]);
    ds_map_add(square[| i],"yy",yy[| _value_y[i]]);
    ds_map_add(square[| i],"zz",zz[| _value_z[i]]);
    ds_map_add(square[| i],"ss",i);
    ds_list_add(xx[| _value_x[i]],square[| i]);
    ds_list_add(yy[| _value_y[i]],square[| i]);
    ds_list_add(zz[| _value_z[i]],square[| i]);
}
for(var i=0;i<ds_list_size(_certain);i++) {
	if(i<16) { 
		solution[_certain[| i]]=_values[| i];
	} else { 
		do { 
			solution[_certain[| i]]=irandom_range(1,16);
		} until (!sudoku_create_solution_check_conflict(_certain[| i]))
	}
}
for(var i=0;i<96;i++) {
	backup[| i]=ds_list_create();
	ds_list_copy(backup[| i],_values);
	for(var j=0;j<ds_list_size(_certain);j++) {
		if((_value_x[i]==_value_x[_certain[| j]] || _value_y[i]==_value_y[_certain[| j]] || _value_z[i]==_value_z[_certain[| j]])&&ds_list_size(backup[| i]>1)) {
			ds_list_delete_value(backup[| i],solution[_certain[| j]]);
		}
	}
	ds_map_add(square[| i],"nn",ds_list_create());
    ds_list_copy(ds_map_find_value(square[| i],"nn"),backup[| i]);
    ds_list_shuffle(ds_map_find_value(square[| i],"nn"));
}

sq=16;
step=0;

while(sq<96) {
	if(ds_list_find_index(_certain,sq)>=0) {
		sq++;
		continue;
	}
    //START
    step++;
    if(step>1000000) { //Safety net (at 4th STD DEV)
        break;
    }
    //Get a number randomly from the available numbers
    solution[sq]=ds_list_find_value(ds_map_find_value(square[| sq],"nn"),0);
    //Are we out of Numbers?
    if(is_undefined(solution[sq])) {
		puzzle[sq]+=1;
        //Replenish this squares numbers and go back 1 square
        ds_list_copy(ds_map_find_value(square[| sq],"nn"),backup[| sq]);
        ds_list_shuffle(ds_map_find_value(square[| sq],"nn"));
        sq--;
        continue;
    }
    //Use it!
    ds_list_delete(ds_map_find_value(square[| sq],"nn"),0);
    //Does it Conflict?
    if(sudoku_create_solution_check_conflict(sq)) {
        //Remove from available numbers for this square
        continue;
    }
    sq++;
} 


// CLEANUP DATASTRUCTURES
for(var i=0;i<96;i++) {
    if(i<6) {
        ds_list_destroy(xx[| i]);
        ds_list_destroy(yy[| i]);
        ds_list_destroy(zz[| i]);
    }
    ds_list_destroy(ds_map_find_value(square[| i],"nn"));
    ds_map_destroy(square[| i]);
	ds_list_destroy(backup[| i]);
}
ds_list_destroy(xx);
ds_list_destroy(yy);
ds_list_destroy(zz);
ds_list_destroy(square);
ds_list_destroy(backup);





file=file_text_open_append("sudokutimes.txt");
file_text_write_string(file,string(step)+"\n");
file_text_close(file);

counter++;
}
