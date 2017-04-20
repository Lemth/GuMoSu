/// @desc sandoku_conjugate_pairs(list)
/// @arg list argument0

var bin=argument0;

/* Conjugate Pairs [O()=] */
for(var a=0;a<ARRAYS;a++) { 
	var array=_arrays[| a];
	var pairs=0;
	var count=2;
	pairs=sandoku_conjugate_pairs_recursive(bin,array,pairs,count);
	
	
		



}















// NAKED PAIRS IN ROW/BOX/COLUMN (or pinned) in GREEN (removables in ORANGE)
for(var i=0;i<18;i++) { 
	var array=_arrays[| i];
	var bucket=[0];
	var square=[0];
	var count=0;
	
	var pop=2;
	for(var j=0;j<16;j++) {
		if(scr_popcount(inventory[| array[| j]])==pop) {
			bucket[count]=inventory[| array[| j]];
			square[count]=array[| j];
			count++;
		}
	}
	for(var o1=0;o1<array_length_1d(bucket);o1++) {
		for(var o2=0;o2<o1;o2++) {
			if(scr_popcount(inventory[| square[o1]]|inventory[| square[o2]])==pop) {
				var remove=inventory[| square[o1]]|inventory[| square[o2]];
				squarecolor[| square[o1]]=c_green;
				squarecolor[| square[o2]]=c_green;
				for(var j=0;j<16;j++) {
					if(array[| j]!=square[o1] && array[| j]!=square[o2]) {
						if(scr_count_binary_ones(inventory[| array[| j]])>1 && inventory[| array[| j]]&~remove!=inventory[| array[| j]]) {
							for(var values=remove;values>0;values&=values-1) {
								if(inventory[| array[| j]]&~(values&-values)!=inventory[| array[| j]]) {
									ds_list_replace(coloring[| array[| j]],log2(values&-values),c_yellow);
									returnvalue="Yes";
								}
							}
						}
					}
				}
			}
		}
	}
	var pop=3;
	for(var j=0;j<16;j++) {
		if(scr_popcount(inventory[| array[| j]])==pop) {
			bucket[count]=inventory[| array[| j]];
			square[count]=array[| j];
			count++;
		}
	}
	for(var o1=0;o1<array_length_1d(bucket);o1++) {
		for(var o2=0;o2<o1;o2++) {
			for(var o3=0;o3<o2;o3++) {
				if(scr_popcount(inventory[| square[o1]]|inventory[| square[o2]]|inventory[| square[o3]])==pop) {
					var remove=inventory[| square[o1]]|inventory[| square[o2]]|inventory[| square[o3]];
					squarecolor[| square[o1]]=c_green;
					squarecolor[| square[o2]]=c_green;
					squarecolor[| square[o3]]=c_green;
					for(var j=0;j<16;j++) {
						if(array[| j]!=square[o1] && array[| j]!=square[o2] && array[| j]!=square[o3]) {
							if(scr_count_binary_ones(inventory[| array[| j]])>1 && inventory[| array[| j]]&~remove!=inventory[| array[| j]]) {
								for(var values=remove;values>0;values&=values-1) {
									if(inventory[| array[| j]]&~(values&-values)!=inventory[| array[| j]]) {
										ds_list_replace(coloring[| array[| j]],log2(values&-values),c_yellow);
										returnvalue="Yes";
									}
								}
							}
						}
					}
				}
			}
		}
	}
}