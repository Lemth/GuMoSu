/// @desc sandoku_conjugate_pairs_recursive(list,array,index,recur,count,squares,values)
/// @arg list argument0
/// @arg array argument1
/// @arg index argument2
/// @arg recur argument3
/// @arg count argument4
/// @arg squares argument5
/// @arg values argument6

var bin=argument0;
var array=argument1;
var index=argument2;
var recur=argument3;
var count=argument4;
var squares=argument5;
var values=argument6;
var r=0;

if(count>0) { //while rercursing
	for(var e=index;e<ELEMENTS;e++) { //loop through elements
		if(pop_state(bin[| array[| e]])==2) { //if element is unsolved
			if(pop_count(values|bin[| array[| e]])<=recur) { //if there are less or equal possible values in this cell than maximum recursion count (COMBINED WITH CELLS FROM PREV RECURSIONS) 
				r+=sandoku_conjugate_pairs_recursive(bin,array,e+1,recur,count-1,squares|(1<<e),values|bin[| array[| e]]); //recursion: index+1, OR values together, count-1 (one step closer to maximum recursion count)
			}
		}
	}
} else { //if maximum recursion count done (value count == square count == maximum recursion count)
	for(var n=$FFFF-squares;n>0;n&=n-1) { //for each element that is not a set bit of 'squares'
		var s=array[| log2(n&-n)]; //square of lowest set bit of 'n'
		if(pop_state(bin[| s])==2) { //if still unsolved
			bin[| s]&=~values; //remove every value that is in 'values' 
			if(pop_state(bin[| s])==1) { //if square is solved
				r+=sandoku_constrain_peers(bin,s); //update peers
			}
		}
	}
}

return r;