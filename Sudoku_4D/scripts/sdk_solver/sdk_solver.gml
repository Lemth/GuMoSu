/// @desc sdk_solver
/// @arg mainlist	argument0
/// return			solves (or -1 if fail)
/// http://www.sudokuwiki.org/sudoku.htm

var catch;

switch(test2 mod 8) {
	case 0:

		catch=sdk_show_possibles(argument0);
		if(catch==-1) {
			show_debug_message("ERROR 1");
			exit;
		} else {
			solver_count+=catch;	
		}

break;	case 1:

		catch=sdk_hidden_singles(argument0);
		if(catch==-1) {
			show_debug_message("ERROR 2");
			exit;
		} else {
			solver_count+=catch;	
		}

break;	case 2:

		catch=sdk_last_possible_number(argument0);
		if(catch==-1) {
			show_debug_message("ERROR 3");
			exit;
		} else {
			solver_count+=catch;	
		}

break;	case 3:
/*
		catch=sdk_naked_pairs(argument0); 
		if(catch==-1) {
			show_debug_message("ERROR 4");
			exit;
		} else {
			solver_count+=catch;	
		}
*/
break;	case 4:
/*
		catch=sdk_hidden_pairs(argument0);
		if(catch==-1) {
			show_debug_message("ERROR 5");
			exit;
		} else {
			solver_count+=catch;	
		}
*/
break;	case 5:
/*
		catch=sdk_pointing_pairs(argument0);
		if(catch==-1) {
			show_debug_message("ERROR 6");
			exit;
		} else {
			solver_count+=catch;	
		}
*/
break; default:
/*
		catch=sdk_brute_force(argument0);
		if(catch==-1) {
			show_debug_message("ERROR Default");
			exit;
		} else {
			solver_count+=catch;	
		}


*/	
break;
}
test2++;
