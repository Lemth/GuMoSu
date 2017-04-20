/// @desc sandoku_last_possible(list)
/// @arg list argument0

var bin=argument0;
var r=0;

/* Last Possible [O(SQUARES*PEERS)=3648] */
for(var s=0;s<SQUARES;s++) {
	if(pop_state(bin[| s])==2) {
		var peers=_peers[| s];
		var memory=$FFFF;
		for(var p=0;p<PEERS;p++) {
			if(pop_state(bin[| peers[| p]])==1) {
				memory&=~bin[| peers[| p]];
				if(memory==0) {
					break;
				}
			}
		}
		if(pop_state(memory)==1) {
			bin[| s]=memory;
			r+=sandoku_constrain_peers(bin,s);
		}
	}
}

return r;