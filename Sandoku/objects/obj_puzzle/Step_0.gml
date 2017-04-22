if(puzzle_create_mode>0) {
	number=scr_puzzle_create();
	if(button[5]>0) { //LOG
		file_sandoku_puzzle=file_text_open_append("sandoku_puzzle.txt");
		file_text_write_string(file_sandoku_puzzle,scr_convert_grid_string(solution)+"\t"+scr_convert_grid_string(puzzle)+"\t"+string(number)+"\t"+string(time)+"\t"+string(recursivity)+"\n"); // solution,step,time
		file_text_close(file_sandoku_puzzle);
	    if(button[5]==1) {
	        button[5]=0;
	    }
	}
	puzzle_create_mode=0;
}

if(button[9]>0) { //export to clip
	clipboard_set_text(scr_convert_grid_string(puzzle));
    button[9]=0;
}
if(button[11]>0) { //import from clip
	if(clipboard_has_text()) {
		time=get_timer();
		var clip=clipboard_get_text();
		if(string_length(clip)==96) {
			scr_convert_string_grid(puzzle,clip);
			for(var i=0;i<96;i++) {
				inventory[| i]=puzzle[i]=0 ? $FFFF : index_to_binary(puzzle[i]);
			}
			valid=scr_puzzle_validate();
			if(valid) {
				valid=scr_sudoku_puzzle_solver(inventory);
			}
		} else {
			show_debug_message("ERROR: wrong string length ("+string(string_length(clip))+").");
		}
		time=get_timer()-time;
	}
    button[11]=0;
}
if(button[15]>0) { //
    for(var i=0;i<96;i++) {
		obj_solver.puzzle[i]=puzzle[i];	
		obj_solver.inventory[| i]=puzzle[i]==0 ? $FFFF : index_to_binary(puzzle[i]);
		obj_solver.solvedsquare[| i]=puzzle[i]==0 ? -1 : 2;
		obj_solver.counter=0;
		obj_solver.automatic=false;
		obj_solver.do_step=false;
		with(obj_solver) {
			for(var j=0;j<39;j++) {
			    checkbox[j]=j<3 ? true : false;
			    active[j]=false;
			    status[j]=noone;
			}
		}
	}
    if(button[15]==1) {
        button[15]=0;
    }
}




if(button[3]>0) { //MAKE SOLVABLE (IN PUZZLE) <<<<<<<<<<<<<<<<<<================================================= USE THE SOLVERS
	puzzle_create_mode=2;
    number=scr_puzzle_create();
	if(button[5]>0) { //LOG
		file_sandoku_puzzle=file_text_open_append("sandoku_puzzle.txt");
		file_text_write_string(file_sandoku_puzzle,scr_convert_grid_string(solution)+"\t"+scr_convert_grid_string(puzzle)+"\t"+string(number)+"\t"+string(time)+"\n"); // solution,step,time
		file_text_close(file_sandoku_puzzle);
	    if(button[5]==1) {
	        button[5]=0;
	    }
	}
	puzzle_create_mode=0;
    if(button[3]==1) {
        button[3]=0;
    }
}
if(button[17]>0) { //MAKE SOLVABLE (IN SOLVER) <<<<<<<<<<<<<<<<<<================================================= USE THE SOLVERS
    for(var i=0;i<96;i++) {
		obj_puzzle.solution[i]=solution[i];	
	}
	obj_puzzle.puzzle_create_mode=2;
    if(button[17]==1) {
        button[17]=0;
    }
}