/// @desc sandoku_solver(list)
/// @arg list argument0

//var bin=ds_list_create();
//ds_list_copy(bin,argument0);
var bin=argument0;
var solved=0;
var r=0;

/* SOLVER */
solved+=sandoku_prepare_puzzle(bin);
show_debug_message(string(solved)+"+"+string(r));

while(1) {
	r+=sandoku_hidden_singles(bin);
	r+=sandoku_last_possible(bin);
	if(r==0) {
		return false;
	}
	solved+=r;
	r=0;
	if(solved>=SQUARES) {
		return true;
	}
}