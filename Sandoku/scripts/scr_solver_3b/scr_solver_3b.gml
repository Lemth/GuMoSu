/// @desc scr_solver_3b(list,array,tarray,index,recur,count,squares,values)
/// @arg list argument0
/// @arg array argument1
/// @arg tarray argument2
/// @arg index argument3
/// @arg recur argument4
/// @arg count argument5
/// @arg squares argument6
/// @arg values argument7

var bin=argument0;
var array=argument1;
var tarray=argument2;
var index=argument3;
var recur=argument4;
var count=argument5;
var squares=argument6;
var values=argument7;
var r=0;

if(count>0) { //while recursing
	for(var v=index;v<VALUES;v++) { //loop through values
		if(tarray[| v]>0) { //if value exists in unsolved square
			if(pop_count(squares|tarray[| v])<=recur) { //if there are less or equal possible values in this cell than maximum recursion count (COMBINED WITH CELLS FROM PREV RECURSIONS) 
				r+=scr_solver_3b(bin,array,tarray,v+1,recur,count-1,squares|tarray[| v],values|(1<<v)); //recursion: index+1, OR squares together, count-1 (one step closer to maximum recursion count)
			}
		}
	}
} else { //if maximum recursion count done (value count == square count == maximum recursion count)
	for(var n=squares;n>0;n&=n-1) { //for each set bit of 'squares'
		var s=array[| log2(n&-n)]; //square of lowest set bit of 'n'
		squarecolor[| s]=c_green;
		if(pop_state(bin[| s])==2) { //if still unsolved
			//bin[| s]&=values;  //remove every value that is NOT in 'values' 
			for(var v=$FFFF-values;v>0;v&=v-1) {
				if(bin[| s]|(v&-v)==bin[| s]) {
					ds_list_replace(coloring[| s],log2(v&-v),c_yellow);
					r++;
				}
			}
			
		}
	}
}

return r;