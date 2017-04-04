if(counter<100) {

// INIT
ds_list_shuffle(_values);

// CREATE DATASTRUCTURES
inventory=ds_list_create();
xx=ds_list_create();
yy=ds_list_create();
zz=ds_list_create();
var library=ds_list_create();
for(var i=0;i<6;i++) {
    xx[| i]=ds_list_create();
    yy[| i]=ds_list_create();
    zz[| i]=ds_list_create();
}
for(var i=0;i<96;i++) {
	solution[i]=0;
    ds_list_add(xx[| _value_x[i]],inventory[| i]);
    ds_list_add(yy[| _value_y[i]],inventory[| i]);
    ds_list_add(zz[| _value_z[i]],inventory[| i]);
} 
for(var i=0;i<16;i++) {
	solution[i]=_values[| i];
}
for(var i=0;i<96;i++) {
	library[| i]=ds_list_create();
	ds_list_copy(library[| i],_values);
	for(var j=0;j<16;j++) {
		if((_value_x[i]==_value_x[_certain[| j]] || _value_y[i]==_value_y[_certain[| j]] || _value_z[i]==_value_z[_certain[| j]])&&ds_list_size(library[| i]>1)) {
			ds_list_delete_value(backup[| i],solution[_certain[| j]]);
		}
	}
	inventory[| i]=ds_list_create();
    ds_list_copy(inventory[| i],library[| i]);
    ds_list_shuffle(inventory[| i]);
}

square=16;
step=0;

while(square<96) {
    //START
    step++;
    if(step>1000000 || square<0) { //Safety net (at 4th STD DEV)
        break;
    }
    //Get a number randomly from the available numbers
    solution[square]=ds_list_find_value(inventory[| square],0);
    //Are we out of Numbers?
    if(is_undefined(solution[square])) {
		puzzle[square]+=1; // just a counter for now
        //Replenish this squares numbers and go back 1 square
        ds_list_copy(inventory[| square],library[| square]);
        ds_list_shuffle(inventory[| square]);
        square--;
        continue;
    }
    //Use it!
    ds_list_delete(inventory[| square],0);
    //Does it Conflict?
    if(sudoku_create_solution_check_conflict(square)) {
        //Remove from available numbers for this square
        continue;
    }
    square++;
} 

// CLEANUP DATASTRUCTURES
for(var i=0;i<96;i++) {
    if(i<6) {
        ds_list_destroy(xx[| i]);
        ds_list_destroy(yy[| i]);
        ds_list_destroy(zz[| i]);
    }
    ds_list_destroy(inventory[| i]);
	ds_list_destroy(library[| i]);
}
ds_list_destroy(xx);
ds_list_destroy(yy);
ds_list_destroy(zz);
ds_list_destroy(inventory);
ds_list_destroy(library);


file=file_text_open_append("sudokutimes.txt");
file_text_write_string(file,string(step)+"\n");
file_text_close(file);

counter++;
}
