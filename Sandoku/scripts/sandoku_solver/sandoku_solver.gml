/// @desc sandoku_solver(list)
/// @arg list argument0

var bin=argument0;
var solved=0;
var r=0;

/* SOLVER */
solved+=sandoku_prepare_puzzle(bin);

while(solved<SQUARES) {
	r+=sandoku_hidden_singles(bin);
	r+=sandoku_last_possible(bin);
	
	if(r==0) {
		return false;
	} else {
		solved+=r;
		r=0;
	}
}

return true;