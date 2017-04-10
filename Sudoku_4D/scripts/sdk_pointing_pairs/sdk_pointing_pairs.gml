/// @desc sdk_pointing_pairs(mainlist)
/// @arg mainlist	argument0
/// return			solves (or -1 if fail)
/// http://www.sudokuwiki.org/intersection_removal

var solved=0;

for(var i=0;i<18;i++) {
	var bucket=[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
	var single=[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
	var second=0;
	var array=_arrays[| i];
	for(var j=0;j<16;j++) {
		if(ds_list_size(argument0[| array[| j]])>1) {
			for(var k=0;k<ds_list_size(argument0[| array[| j]]);k++) {
				bucket[ds_list_find_value(argument0[| array[| j]],k)-1]+=1; // add to bucket
				single[ds_list_find_value(argument0[| array[| j]],k)-1]=array[| j]; // remember last square
			}
		} else if (ds_list_size(argument0[| array[| j]])<1) {
			return -1;
		}
	}
	for(var j=0;j<16;j++) {
		if(bucket[j]==2) {
			for(var k=0;k<16;k++) {
				if(single[j]!=array[| k] && ds_list_find_index(argument0[| array[| k]],j+1)!=-1) {
					second=array[| k];
					if(i<6) {
						if(_value_y[single[j]]==_value_y[second]) {
							var aisle=_arrays[| _value_y[second]+6];
							for(var l=0;l<16;l++) {
								if(_value_x[aisle[| l]]!=_value_x[second]) {
									switch(ds_list_delete_value(argument0[| aisle[| l]],j+1)) {
										case 0:
											return -1;
										case 1:
											var catch=sdk_update_for_solved_cell(argument0,aisle[| l]);
											if(catch==-1) {
												return -1;
											}
											solved+=1+catch;
										break;
									}
								}
							}
						} else if(_value_z[single[j]]==_value_z[second]) {
							var aisle=_arrays[| _value_z[second]+12];
							for(var l=0;l<16;l++) {
								if(_value_x[aisle[| l]]!=_value_x[second]) {
									switch(ds_list_delete_value(argument0[| aisle[| l]],j+1)) {
										case 0:
											return -1;
										case 1:
											var catch=sdk_update_for_solved_cell(argument0,aisle[| l]);
											if(catch==-1) {
												return -1;
											}
											solved+=1+catch;
										break;
									}
								}
							}
						}
					} else if(i<12) {
						if(_value_x[single[j]]==_value_x[second]) {
							var aisle=_arrays[| _value_x[second]];
							for(var l=0;l<16;l++) {
								if(_value_y[aisle[| l]]!=_value_y[second]) {
									switch(ds_list_delete_value(argument0[| aisle[| l]],j+1)) {
										case 0:
											return -1;
										case 1:
											var catch=sdk_update_for_solved_cell(argument0,aisle[| l]);
											if(catch==-1) {
												return -1;
											}
											solved+=1+catch;
										break;
									}
								}
							}
						} else if(_value_z[single[j]]==_value_z[second]) {
							var aisle=_arrays[| _value_z[second]+12];
							for(var l=0;l<16;l++) {
								if(_value_y[aisle[| l]]!=_value_y[second]) {
									switch(ds_list_delete_value(argument0[| aisle[| l]],j+1)) {
										case 0:
											return -1;
										case 1:
											var catch=sdk_update_for_solved_cell(argument0,aisle[| l]);
											if(catch==-1) {
												return -1;
											}
											solved+=1+catch;
										break;
									}
								}
							}
						}
					} else if(i<18) {
						if(_value_x[single[j]]==_value_x[second]) {
							var aisle=_arrays[| _value_x[second]];
							for(var l=0;l<16;l++) {
								if(_value_z[aisle[| l]]!=_value_z[second]) {
									switch(ds_list_delete_value(argument0[| aisle[| l]],j+1)) {
										case 0:
											return -1;
										case 1:
											var catch=sdk_update_for_solved_cell(argument0,aisle[| l]);
											if(catch==-1) {
												return -1;
											}
											solved+=1+catch;
										break;
									}
								}
							}
						} else if(_value_y[single[j]]==_value_y[second]) {
							var aisle=_arrays[| _value_y[second]+6];
							for(var l=0;l<16;l++) {
								if(_value_z[aisle[| l]]!=_value_z[second]) {
									switch(ds_list_delete_value(argument0[| aisle[| l]],j+1)) {
										case 0:
											return -1;
										case 1:
											var catch=sdk_update_for_solved_cell(argument0,aisle[| l]);
											if(catch==-1) {
												return -1;
											}
											solved+=1+catch;
										break;
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
show_debug_message("pointing pairs: "+string(solved));
return solved;
