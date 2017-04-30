/// @desc scr_solver_3()
/// HIDDEN PAIRS/TRIPLES (HIDDEN CANDIDATES)

var returnvalue="No"
var r=0;
/* Hidden Pairs [O(ARRAYS*(ELEMENTS*ELEMENTS))=4608] */
for(var a=0;a<ARRAYS;a++) { 
	var array=_arrays[| a];
	
	var empty=0;
	for(var e=0;e<ELEMENTS;e++) {
		if(pop_state(inventory[| array[| e]])==2) {
			empty++;
		}
	}
	
	//if(argument1<empty) {
		var tarray=ds_list_create();
		for(var i=0;i<VALUES;i++) {
			tarray[| i]=0;
		}
		for(var e=0;e<ELEMENTS;e++) {
			if(pop_state(inventory[| array[| e]])==2) {
				for(var v=inventory[| array[| e]];v>0;v&=v-1) {
					tarray[| log2(v&-v)]|=(1<<e);
				}
			}
		}
		for(var count=2;count<9;count++) {
			if(count<empty) {
				r+=scr_solver_3b(inventory,array,tarray,0,count,count,0,0);
			}
		}
		ds_list_destroy(tarray);
		if(r>0) {
			returnvalue="Yes";
		}
	//}
}



/*

// HIDDEN PAIRS IN ROW/BOX/COLUMN (or pinned) in GREEN (removables in ORANGE)
for(var i=0;i<18;i++) { 
	var array=_arrays[| i];
	var bucket=[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
	var square1=[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
	var square2=[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
	var square3=[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
	for(var j=0;j<16;j++) {
		for(var values=inventory[| array[| j]];values>0;values&=values-1) {
			bucket[log2(values&-values)]++;
			if(square1[log2(values&-values)]==0) {
				square1[log2(values&-values)]=array[| j];
			} else if(square2[log2(values&-values)]==0) {
				square2[log2(values&-values)]=array[| j];
			} else {
				square3[log2(values&-values)]=array[| j];
			}
		}
	}
	for(var o1=0;o1<16;o1++) {
		for(var o2=0;o2<o1;o2++) {
			if(bucket[o1]==2 && bucket[o2]==2 && square1[o1]==square1[o2] && square2[o1]==square2[o2]) {
				for(var j=0;j<16;j++) {
					if(scr_count_binary_ones(inventory[| square1[o1]])>1) {
						if(inventory[| square1[o1]]|(1<<j)==inventory[| square1[o1]]) {
							if(j==o1 || j==o2) {
								ds_list_replace(coloring[| square1[o1]],j,c_green);
							} else {
								ds_list_replace(coloring[| square1[o1]],j,c_yellow);
								returnvalue="Yes";
							}
						}
					}
					if(scr_count_binary_ones(inventory[| square2[o1]])>1) {
						if(inventory[| square2[o1]]|(1<<j)==inventory[| square2[o1]]) {
							if(j==o1 || j==o2) {
								ds_list_replace(coloring[| square2[o1]],j,c_green);
							} else {
								ds_list_replace(coloring[| square2[o1]],j,c_yellow);
								returnvalue="Yes";
							}
						}
					}
				}
			}
			/*
			for(var o3=0;o3<o2;o3++) {
				if(bucket[o1]<=3 && bucket[o2]<=3 && bucket[o3]<=3 && bucket[o1]>=2 && bucket[o2]>=2 && bucket[o3]>=2) { 
					if((square1[o1]==square1[o2] || square1[o2]==square1[o3] || square1[o1]==square1[o3])&& (square2[o1]==square2[o2] || square2[o2]==square2[o3] || square2[o1]==square2[o3])&& (square3[o1]==square3[o2] || square3[o2]==square3[o3] || square3[o1]==square3[o3])) {
						for(var j=0;j<16;j++) {
							if(scr_count_binary_ones(inventory[| square1[o1]])>1) {
								if(inventory[| square1[o1]]|(1<<j)==inventory[| square1[o1]]) {
									if(j==o1 || j==o2 || j==o3) {
										ds_list_replace(coloring[| square1[o1]],j,c_green);
									} else {
										ds_list_replace(coloring[| square1[o1]],j,c_yellow);
										returnvalue="Yes";
									}
								}
							}
							if(scr_count_binary_ones(inventory[| square2[o1]])>1) {
								if(inventory[| square2[o1]]|(1<<j)==inventory[| square2[o1]]) {
									if(j==o1 || j==o2 || j==o3) {
										ds_list_replace(coloring[| square2[o1]],j,c_green);
									} else {
										ds_list_replace(coloring[| square2[o1]],j,c_yellow);
										returnvalue="Yes";
									}
								}
							}
							if(scr_count_binary_ones(inventory[| square3[o1]])>1) {
								if(inventory[| square3[o1]]|(1<<j)==inventory[| square3[o1]]) {
									if(j==o1 || j==o2 || j==o3) {
										ds_list_replace(coloring[| square3[o1]],j,c_green);
									} else {
										ds_list_replace(coloring[| square3[o1]],j,c_yellow);
										returnvalue="Yes";
									}
								}
							}
							
							if(scr_count_binary_ones(inventory[| square1[o2]])>1) {
								if(inventory[| square1[o2]]|(1<<j)==inventory[| square1[o2]]) {
									if(j==o1 || j==o2 || j==o3) {
										ds_list_replace(coloring[| square1[o2]],j,c_green);
									} else {
										ds_list_replace(coloring[| square1[o2]],j,c_yellow);
										returnvalue="Yes";
									}
								}
							}
							if(scr_count_binary_ones(inventory[| square2[o2]])>1) {
								if(inventory[| square2[o2]]|(1<<j)==inventory[| square2[o2]]) {
									if(j==o1 || j==o2 || j==o3) {
										ds_list_replace(coloring[| square2[o2]],j,c_green);
									} else {
										ds_list_replace(coloring[| square2[o2]],j,c_yellow);
										returnvalue="Yes";
									}
								}
							}
							if(scr_count_binary_ones(inventory[| square3[o2]])>1) {
								if(inventory[| square3[o2]]|(1<<j)==inventory[| square3[o2]]) {
									if(j==o1 || j==o2 || j==o3) {
										ds_list_replace(coloring[| square3[o2]],j,c_green);
									} else {
										ds_list_replace(coloring[| square3[o2]],j,c_yellow);
										returnvalue="Yes";
									}
								}
							}
							
							if(scr_count_binary_ones(inventory[| square1[o3]])>1) {
								if(inventory[| square1[o3]]|(1<<j)==inventory[| square1[o3]]) {
									if(j==o1 || j==o2 || j==o3) {
										ds_list_replace(coloring[| square1[o3]],j,c_green);
									} else {
										ds_list_replace(coloring[| square1[o3]],j,c_yellow);
										returnvalue="Yes";
									}
								}
							}
							if(scr_count_binary_ones(inventory[| square2[o3]])>1) {
								if(inventory[| square2[o3]]|(1<<j)==inventory[| square2[o3]]) {
									if(j==o1 || j==o2 || j==o3) {
										ds_list_replace(coloring[| square2[o3]],j,c_green);
									} else {
										ds_list_replace(coloring[| square2[o3]],j,c_yellow);
										returnvalue="Yes";
									}
								}
							}
							if(scr_count_binary_ones(inventory[| square3[o3]])>1) {
								if(inventory[| square3[o3]]|(1<<j)==inventory[| square3[o3]]) {
									if(j==o1 || j==o2 || j==o3) {
										ds_list_replace(coloring[| square3[o3]],j,c_green);
									} else {
										ds_list_replace(coloring[| square3[o3]],j,c_yellow);
										returnvalue="Yes";
									}
								}
							}
						}
					}
				}
			
			}
			*/ /*
		}
	}
}
		*/

return returnvalue;