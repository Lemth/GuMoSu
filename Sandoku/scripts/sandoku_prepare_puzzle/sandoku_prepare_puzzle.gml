/// @desc sandoku_prepare_puzzle(list)
/// @arg list argument0

var bin=argument0;
var r=0;

/* Prepare Puzzle */

/* Remove Known Possibles [O(SQUARES*constrain_peers)=3648]*/
for(var s=0;s<SQUARES;s++) {
	if(pop_state(bin[| s])==1) {
		sandoku_constrain_peers(bin,s);
	} 
}
/* Count Solved Squares [O(SQUARES)=96] */
for(var s=0;s<SQUARES;s++) {
	if(pop_state(bin[| s])==1) {
		r++;
	} 
}

return r;