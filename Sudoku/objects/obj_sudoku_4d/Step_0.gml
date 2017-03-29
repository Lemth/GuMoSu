//if(counter<1) {
	//sudoku_create_solution_validation(); //check previous one [only for testing]

	//sudoku_4D();
//}

						
if(square<96) {							
	//START						
	step++;						
	if(step>1000000) { //Safety net (at 4th STD DEV)						
		for(var i=0;i<81;i++) {					
			ds_list_clear(squares[| i]);				
			ds_list_add(squares[| i],1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16);				
			ds_list_shuffle(squares[| i]);				
		}					
		square=0;					
		step=0;					
		exit;					
	}						
	//Get a number randomly from the available numbers						
	solution[square]=ds_list_find_value(squares[| square],0);						
	//Are we out of Numbers?						
	if(is_undefined(solution[square])) {						
		//Replenish this squares numbers and go back 1 square					
		ds_list_add(squares[| square],1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16);					
		ds_list_shuffle(squares[| square]);					
		square--;					
		exit;					
	}						
	//Use it!						
	ds_list_delete(squares[| square],0);						
	//Does it Conflict?						
	if(sudoku_4D_create_solution_check_conflict(square)) {						
		//Remove from available numbers for this square					
		exit;					
	}						
	square++;						
}					