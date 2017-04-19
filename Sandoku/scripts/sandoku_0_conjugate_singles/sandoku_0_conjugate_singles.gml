/// @desc sandoku_0_conjugate_singles(list)
/// @arg list argument0

//return singles / show possibles








for(var i=0;i<96;i++) { // RETURN SINGLES
	if(scr_count_binary_ones(inventory[| i])>1) {
		for(var j=0;j<38;j++) {
			var peer=ds_list_find_value(_peers[| i],j);
			if(scr_count_binary_ones(inventory[| peer])==1) {
				if(inventory[| i]&~inventory[| peer]!=inventory[| i]) {
					inventory[| i]&=~inventory[| peer];
					returnvalue="Yes";
				}
				if (scr_count_binary_ones(inventory[| i])==1) {
					squarecolor[| i]=c_green;
					solvedsquare[| i]=0
				}
			}
		}
	} 
}