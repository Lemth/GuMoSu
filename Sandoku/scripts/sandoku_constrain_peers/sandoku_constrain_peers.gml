/// @desc sandoku_constrain_peers(list,square)
/// @arg list argument0
/// @arg square argument1

var bin=argument0;
var s=argument1;
var r=1;

/* Constrain Peers */
var peers=_peers[| s];
for(var p=0;p<PEERS;p++) { //loop through each peer
	var peer=peers[| p];
	if(pop_state(bin[| peer])==2) { //if unsolved
		bin[| peer]&=~bin[| s]; //remove recently solved value from this peer
		if(pop_state(bin[| peer])==1) { //if square is solved
			r+=sandoku_constrain_peers(bin,peer); //update peers
		}
	}
}

return r;