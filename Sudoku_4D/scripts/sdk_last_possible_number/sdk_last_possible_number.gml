/// @desc sdk_last_possible_number(mainlist)
/// @arg mainlist	argument0
/// return			solves (or -1 if fail)
/// http://www.sudokuwiki.org/Getting_Started

var solved=0;

for(var i=0;i<96;i++) { // HIDDEN SINGLES
	if(ds_list_size(argument0[| i])>1) {
		var bucket=0;
		var single=0;
		for(var j=0;j<ds_list_size(_peers[| i]);j++) {
			var peer=ds_list_find_value(_peers[| i],j);
			if(ds_list_size(argument0[| peer])>1) {
				for(var k=0;k<ds_list_size(argument0[| peer]);k++) {
					bucket=bucket|power(2,ds_list_find_value(argument0[| peer],k)-1); //x OR y
				}
			}
		}
		for(var j=0;j<ds_list_size(argument0[| i]);j++) {
			single=single|power(2,ds_list_find_value(argument0[| i],j)-1); //x OR y
		}
		bucket=(bucket^single)&single; //(x XOR y) AND y
		if(bucket!=0 && ((bucket&(bucket-1))==0)) {
			ds_list_clear(argument0[| i]);
			ds_list_add(argument0[| i],log2(bucket)+1);
			var catch=sdk_update_for_solved_cell(argument0,i);
			if(catch==-1) {
				return -1;
			}
			solved+=1+catch;
		}
	} else if (ds_list_size(argument0[| i])<1) {
		return -1;
	}
}

show_debug_message("last possible number: "+string(solved));
return solved;