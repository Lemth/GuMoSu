/// @desc sdk_solver
/// @arg mainlist	argument0
/// return			solves (or -1 if fail)
/// http://www.sudokuwiki.org/sudoku.htm

var catch;

catch=sdk_show_possibles(argument0);
if(catch==-1) {
	show_debug_message("ERROR 1");
	exit;
} else {
	solver_count+=catch;	
}

catch=sdk_hidden_singles(argument0);
if(catch==-1) {
	show_debug_message("ERROR 2");
	exit;
} else {
	solver_count+=catch;	
}

catch=sdk_last_possible_number(argument0);
if(catch==-1) {
	show_debug_message("ERROR 3");
	exit;
} else {
	solver_count+=catch;	
}

/* ERRORS!
catch=sdk_naked_pairs(argument0); 
if(catch==-1) {
	show_debug_message("ERROR 4");
	exit;
} else {
	solver_count+=catch;	
}
*/

/*
catch=sdk_hidden_pairs(argument0);
if(catch==-1) {
	show_debug_message("ERROR 5");
	exit;
} else {
	solver_count+=catch;	
}
*/

/*
catch=sdk_pointing_pairs(argument0);
if(catch==-1) {
	show_debug_message("ERROR 6");
	exit;
} else {
	solver_count+=catch;	
}
*/
