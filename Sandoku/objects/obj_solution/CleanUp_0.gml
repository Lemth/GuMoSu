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
