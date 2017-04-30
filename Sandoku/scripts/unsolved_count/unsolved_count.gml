/// @desc unsolved_count(list, array)
/// @arg list argument0
/// @arg list argument1

var bin=argument0;
var array=argument1;
var counter=0;

for(var e=0;e<ELEMENTS;e++) {
	if(pop_state(bin[| array[| e]])==2) {
		counter++;
	}
}
	
return counter;