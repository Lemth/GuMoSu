/// @desc STEP
/*
button=[	"Solution:",noone, //0 1
			"Create",0, //2 3
			"Log",0, //4 5
			"Clipboard:",noone, //6 7
			"Export",0, //8 9
	   		"Import",0, //10 11
	   		"Puzzle:",noone, //12 13
	   		"Solver",0, //14 15
	   		"Brute",0]; //16 17
*/

if(button[3]>0) { //CREATE
    scr_solution_create();
	if(button[5]>0) { //LOG
		file_sandoku_solution=file_text_open_append("sandoku_solution.txt");
		file_text_write_string(file_sandoku_solution,scr_convert_grid_string(solution)+"\t"+string(step)+"\t"+string(time)+"\n"); // solution,step,time
		file_text_close(file_sandoku_solution);
	    if(button[5]==1) {
	        button[5]=0;
	    }
	}
    if(button[3]==1) {
        button[3]=0;
    }
}

if(button[9]>0) { //export to clip
	clipboard_set_text(scr_convert_grid_string(solution));
    button[9]=0;
}
if(button[11]>0) { //import from clip
	if(clipboard_has_text()) {
		var clip=clipboard_get_text();
		if(string_length(clip)==96) {
			scr_convert_string_grid(solution,clip);
			valid=scr_solution_validate();
			time=0;
			step=0;
		} else {
			show_debug_message("ERROR: wrong string length ("+string(string_length(clip))+").");
		}
	}
    button[11]=0;
}

if(button[17]>0) { //BRUTE 
    for(var i=0;i<96;i++) {
		obj_puzzle.solution[i]=solution[i];	
	}
	obj_puzzle.puzzle_create_mode=2;
    if(button[17]==1) {
        button[17]=0;
    }
}



if(button[15]>0) { //SOLVER <<<<<<<=================================================================<<<<<<<
    for(var i=0;i<96;i++) {
		obj_puzzle.solution[i]=solution[i];	
	}
	obj_puzzle.puzzle_create_mode=1;
    if(button[15]==1) {
        button[15]=0;
    }
}




