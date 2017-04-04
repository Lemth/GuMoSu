if(counter<100) {

sudoku_create_solution_create_ds();

//START
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
