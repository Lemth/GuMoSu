/// @desc unsolved_count(list, array)
/// @arg list argument0
/// @arg list argument1

var bin=argument0;
var array=argument1;
var size=ds_list_size(array);
var count=0;

for(var i=0;i<size;i++) {
	if(pop_state(bin[| array[| i]])==2) {
		count++;
	}
}
	
return count;