/// @desc sandoku_hidden_singles(list)
/// @arg list argument0

var bin=argument0;
var r=0;

/* Hidden Singles [O(ARRAYS*(ELEMENTS*2))=576] */
for(var a=0;a<ARRAYS;a++) { 
	var array=_arrays[| a];
	var memory=0;
	var singles=0;
	for(var e=0;e<ELEMENTS;e++) {
		var values=bin[| array[| e]];
		if(pop_state(values)==2) {
			singles=(memory^~singles)&(memory^values);
			memory|=values;
		}
	}
	if(singles>0) {
		for(var e=0;e<ELEMENTS;e++) {
			var element=array[| e];
			if(pop_state(bin[| element])==2 && pop_state(bin[| element]&singles)==1) {
				bin[| element]&=singles;
				r+=sandoku_constrain_peers(bin,element);
			}
		}
	}
}

return r;