/// @desc sandoku_solver(list)
/// @arg list argument0

var bin=argument0;
var solved=0;
var r=0;

/* SOLVER */
solved+=sandoku_prepare_puzzle(bin);

while(solved<SQUARES) {
	r+=sandoku_hidden_singles(bin);
	if(r==0) {
		r+=sandoku_last_possible(bin);
	}
	var count=2;
	while(r==0 && count<9) {
		r+=sandoku_conjugate_pairs(bin,count);
		if(r==0) {
			r+=sandoku_hidden_pairs(bin,count);
		}
		if(r==0 && count<=4) {
			r+=sandoku_pointing_pairs(bin,count);
		}
		count++;
	}
	
	/////////////SECURITY/////////////////////////
	var check=0; for(var s=0;s<SQUARES;s++) {
		if(pop_state(bin[| s])==1) { check++; }
	} if(check!=solved+r) { r=check-solved;
		show_message("WRONG AMOUNT OF R: "+string(check)+"+"+string(solved)+"+"+string(r));
	}/////////////SECURITY///////////////////////
	
	
	if(r==0) {
		return false;
	} else {
		solved+=r;
		r=0;
	}
}

return true;