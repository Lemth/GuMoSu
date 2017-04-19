/// @desc scr_solver_check()

var returnvalue=0;

for(var i=0;i<96;i++) { //
	var clr=coloring[| i];
	var squarecount=0;
	for(var j=0;j<16;j++) {
		if(clr[| j]==c_green) {
			squarecount++;
		}
		if(clr[| j]==c_yellow) {
			inventory[| i]&=~(1<<j);
			if(scr_popcount(inventory[| i])==1) {
				solvedsquare[| i]=1;
				returnvalue++;
			}
		}
	}
	if(squarecount==1) {
		for(var j=0;j<16;j++) {
			if(clr[| j]==c_green) {
				inventory[| i]=(1<<j);
				solvedsquare[| i]=1;
				returnvalue++;
			}
		}
	}
	for(var j=0;j<16;j++) {
		clr[| j]=0;
	}
	
	squarecolor[| i]=0;
	
	if(solvedsquare[| i]==0) {
		solvedsquare[| i]=1;
		returnvalue++;
	}
}

var completeness=true;
for(var i=0;i<96;i++) { // CHECK IF PUZZLE IS STILL VALID
	if(inventory[| i]==0) {
		errormsg="0 values for square ("+string(i)+")";
	}
	if(solvedsquare[| i]<1) {
		completeness=false;
	}
	if(scr_count_binary_ones(inventory[| i])!=1) {
		completeness=false;
	}
}
for(var i=0;i<18;i++) {
	var array=_arrays[| i];
	var validate=0;
	for(var j=0;j<16;j++) {
		if(scr_count_binary_ones(inventory[| array[| j]])==1) {
			if(validate&inventory[| array[| j]]==0) {
				validate|=inventory[| array[| j]];
			} else {
				errormsg="duplicate values in array ("+string(array)+")";
			}
		}
	}
}
if(completeness==true) {
	for(var i=0;i<96;i++) {
		solution[i]=binary_to_index(inventory[| i]);
	}
	errormsg="SOLVED!";
	for(var i=0;i<18;i++) {
		var array=_arrays[| i];
		var validate=0;
	    for(var j=0;j<16;j++) {
	        validate|=index_to_binary(solution[array[| j]]);
	    }
	    if(validate!=65535) {
	        completeness=false;
	    }
	}
	if(completeness==true) {
		errormsg+=" valid solution";
	} else {
		errormsg="INVALID SOLUTION";
	}
	automatic=false;
}


return returnvalue;