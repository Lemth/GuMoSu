/// @desc sandoku_constrain_peers(list,square)
/// @arg list argument0
/// @arg square argument1

var bin=argument0;
var s=argument1;
var r=1;

/* Constrain Peers [O(PEERS)=38]*/
var peers=_peers[| s];
for(var p=0;p<PEERS;p++) {
	var peer=peers[| p];
	if(pop_state(bin[| peer])==2) {
		bin[| peer]&=~bin[| s];
		if(pop_state(bin[| peer])==1) {
			r+=sandoku_constrain_peers(bin,peer);
		}
	}
}

return r;