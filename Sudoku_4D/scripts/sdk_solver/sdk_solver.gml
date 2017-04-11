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

		catch=sdk_naked_pairs(argument0); 
		if(catch==-1) {
			show_debug_message("ERROR 4");
			exit;
		} else {
			solver_count+=catch;	
		}

break;	case 4:

		catch=sdk_hidden_pairs(argument0);
		if(catch==-1) {
			show_debug_message("ERROR 5");
			exit;
		} else {
			solver_count+=catch;	
		}

break;	case 5:

		catch=sdk_pointing_pairs(argument0);
		if(catch==-1) {
			show_debug_message("ERROR 6");
			exit;
		} else {
			solver_count+=catch;	
		}

break; default:
/*
		catch=sdk_brute_force(argument0);
		if(catch==-1) {
			show_debug_message("ERROR Default");
			exit;
		} else {
			solver_count+=catch;	
		}

/// @desc sdk_brute_force(mainlist)
/// @arg mainlist	argument0
/// return			solves (or -1 if fail)

var solved=0;
var smallest=0;
		
for(var i=0;i<96;i++) { // BRUTE FORCE
	if(ds_list_size(argument0[| i])==2) {
		smallest=i;
		break;
	} else if(ds_list_size(argument0[| i]>2)) {
		if(ds_list_size(argument0[| i]<ds_list_size(argument0[| smallest]))) {
			smallest=i;	
		}
	}
}
var remember=ds_list_create();
ds_list_copy(remember,argument0[| smallest]);
ds_list_clear(argument0[| smallest]);
ds_list_add(argument0[| smallest],remember[| 0]);
if(!sdk_solver(argument0)) { //if not solvable
	ds_list_delete(remember,0);
	ds_list_copy(argument0[| smallest],remember);
}
ds_list_destroy(remember);
switch(ds_list_size(argument0[| smallest])) { 
	case 0:
		return -1; 
	case 1:
		var catch=sdk_update_for_solved_cell(argument0,smallest);
		if(catch==-1) { return -1; } 
		solved+=1+catch; 
	default:
	break;
}
return solved;
*/	
break;
}
test2++;
