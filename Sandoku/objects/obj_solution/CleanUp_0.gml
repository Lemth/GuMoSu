//DESTROY DATASTRUCTURES
ds_list_destroy_nested(inventory);
ds_list_destroy_nested(library);
ds_list_destroy(_values);


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
    if(button[1]==1) {
        button[1]=0;
    }
}
if(button[5]>0) { //LOG
	file=file_text_open_append("sudokutimes.txt");
	file_text_write_string(file,scr_convert_grid_string(solution)+","+string(step)+","+step(time)+"\n"); // solution,step,time
	file_text_close();
    if(button[1]==1) {
        button[1]=0;
    }
}
if(button[9]>0) { //export to clip
	clipboard_set_text(scr_convert_grid_string(solution));
    if(button[1]==1) {
        button[1]=0;
    }
}
if(button[9]>0) { //import from clip
	if(clipboard_has_text) {
		var clip=clipboard_get_text();
		if(string_length(clip)==96) {
			scr_convert_string_grid(solution,clip);
		} else {
			show_debug_message("ERROR: wrong string length ("+string(string_length(str))+").");
		}
	}
    if(button[1]==1) {
        button[1]=0;
    }
}
if(button[3]>0) { //SOLVER <<<<<<<=================================================================<<<<<<<
    //
    if(button[1]==1) {
        button[1]=0;
    }
}
if(button[3]>0) { //BRUTE 
    for(var i=0;i<96;i++) {
		obj_puzzle.puzzle[i]=solution[i];	
	}
	obj_puzzle.puzzle_create_mode=2;
    if(button[1]==1) {
        button[1]=0;
    }
}


/// @desc scr_convert_string_grid(array,string)
/// @arg array argument0
/// @arg string argument1
for(var i=0;i<96;i++) {
	var chr=string_char_at(argument1,i+1);
	if(chr==".") {
		argument0[@ i]=0;
	} else if(chr=="A") {
		argument0[@ i]=11;
	} else if(chr=="B") {
		argument0[@ i]=12;
	} else if(chr=="C") {
		argument0[@ i]=13;
	} else if(chr=="D") {
		argument0[@ i]=14;
	} else if(chr=="E") {
		argument0[@ i]=15;
	} else if(chr=="F") {
		argument0[@ i]=16;
	} else {
		argument0[@ i]=real(chr)+1;
	}
}

/// @desc scr_convert_grid_string(array)
/// @arg array argument0
var str="";
for(var i=0;i<96;i++) {
	switch(argument0[i]) {
		case 0:		str+=".";
break;	case 11:	str+="A";
break;	case 12:	str+="B";
break;	case 13:	str+="C";
break;	case 14:	str+="D";
break;	case 15:	str+="E";
break;	case 16:	str+="F";
break;	default:	str+=string(argument0[i]-1);
		break;
	}
}
if(string_length(str)==96) {
	return str;
} else {
	return ("ERROR: wrong string length ("+string(string_length(str))+").");
}
			
			
			
			
