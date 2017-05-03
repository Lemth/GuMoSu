/// @desc scr_solution_create()
time=get_timer();
step=0;
scr_solution_restart();
var maxsquare=0;

var sr_pos=-1;
var sr_mov=0;
var txt_pos="";
var txt_mov="";
var sr_freq=0;
var txt_freq="";
var ctr=0;


//START
while(square<96) { 
	
	if(ctr<600 && sr_pos!=square) {
		sr_freq+=square;
		txt_freq+=string(sr_freq)+",";
		
		sr_pos=square;
		ctr++;
	}
	
	
	if(square>maxsquare) { //////////16 t/m 24 @ 32^ 
		if(square==32 || square==48) {
			scr_solution_update(square); //////////32 t/m 40 @ 48^ 
		}
	}
	maxsquare=max(maxsquare,square);
	
    step++;
//    if((step mod 20000)==0 || square<16) { //Safety net (at median / 20.000) CUT SAFETY NET FOR SR !!!!!!!
//		if(step>=1000000 || square<0) {
	if((step mod 60000)==0 || square<16) { //Safety net (at median / 20.000) CUT SAFETY NET FOR SR !!!!!!!
		if(step>=60000 || square<0) {
			
			while(ctr<600) {
				txt_freq+=string(sr_freq)+",";
				ctr++;
			}
			file_sr_freq=file_text_open_append("sandoku_solution_research_freq.txt");
			file_text_write_string(file_sr_freq,txt_freq+string(step)+"\n");
			file_text_close(file_sr_freq);

			exit;
		}
		scr_solution_restart();
		maxsquare=0;
        continue;
    }
	
    solution[square]=ds_list_find_value(inventory[| square],0); //Get a number randomly from the available numbers
    if(is_undefined(solution[square])) { //Are we out of Numbers?
        ds_list_copy(inventory[| square],library[| square]); //Replenish inventory from (reduced) library
        square--; //and go back 1 square
        continue;
    }
    ds_list_delete(inventory[| square],0); //Use it!
    if(scr_solution_check_constraints(square)) { //Does it Conflict?
        continue; //Remove from available numbers for this square
    }
    square++;
} 

valid=scr_solution_validate();

time=get_timer()-time;

while(ctr<600) {
	txt_freq+=string(sr_freq)+",";
	ctr++;
}
file_sr_freq=file_text_open_append("sandoku_solution_research_freq.txt");
file_text_write_string(file_sr_freq,txt_freq+string(step)+"\n");
file_text_close(file_sr_freq);
