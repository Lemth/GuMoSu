/// @desc sudoku_create_solution_check_conflict(square)							
/// @arg square argument0							
var square=argument0;							
var region=regions[| get_region[| square]];							
var column1=columns[| get_column1[| square]];							
var column2=columns[| get_column2[| square]];							
							
//Check region and columns							
for(var i=0;i<16;i++) {							
	if(region[| i]!=square && solution[region[| i]]==solution[square]) {						
		return true;					
	}						
	if(column1[| i]!=square && solution[column1[| i]]==solution[square]) {						
		return true;					
	}						
	if(column2[| i]!=square && solution[column2[| i]]==solution[square]) {						
		return true;					
	}						
}							
							
return false;							