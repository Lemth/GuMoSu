if(counter<100) {

//INIT
ds_list_shuffle(_values); //1,2,3,..,16
for(var i=0;i<96;i++) {
	solution[i]=i<16 ? _values[| i] : 0; //ternary op; <expression> ? <expression is true> : <expression is false>
} 

//CREATE DATASTRUCTURES
inventory=ds_list_create(); //inventory of values for each square
library=ds_list_create(); //library of values to replenish inventory with for each square
for(var i=16;i<96;i++) { //starting at 17th (i=16) square (all previous are init with 0)
	inventory[| i]=ds_list_create();
	library[| i]=ds_list_create();
	ds_list_copy(library[| i],_values);
	for(var j=0;j<16;j++) { //remove assigned numbers from library of each square
		if(_value_x[i]==_value_x[j] || _value_y[i]==_value_y[j] || _value_z[i]==_value_z[j]) {
			ds_list_delete_value(library[| i],solution[j]);
		}
	}
	ds_list_shuffle(library[| i]); //create randomization
    ds_list_copy(inventory[| i],library[| i]); //replenish inventory from (reduced) library
}

//START
step=0;
square=16;
while(square<96) { 
    step++;
    if(step>1000000 || square<16) { //Safety net (at 4th STD DEV)
        break;
    }
    solution[square]=ds_list_find_value(inventory[| square],0); //Get a number randomly from the available numbers
    if(is_undefined(solution[square])) { //Are we out of Numbers?
		puzzle[square]+=1; // just a counter for now
        ds_list_copy(inventory[| square],library[| square]); //Replenish inventory from (reduced) library
        square--; //and go back 1 square
        continue;
    }
    ds_list_delete(inventory[| square],0); //Use it!
    if(sudoku_create_solution_check_conflict(square)) { //Does it Conflict?
        continue; //Remove from available numbers for this square
    }
    square++;
} 

//CLEANUP DATASTRUCTURES
for(var i=16;i<96;i++) { //starting at 17th (i=16) square (all previous are init with 0)
    ds_list_destroy(inventory[| i]);
	ds_list_destroy(library[| i]);
}
ds_list_destroy(inventory);
ds_list_destroy(library);

file=file_text_open_append("sudokutimes.txt");
file_text_write_string(file,string(step)+"\n");
file_text_close(file);

counter++;
}
