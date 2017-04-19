if(do_step==true || automatic==true) {
	active[counter]=false;
    if(status[counter]=="Yes") {
        counter=-1;
        for(var i=0;i<array_length_1d(checkbox);i++) {
            status[i]=noone;
        }
    }    
    do {
        counter++;
        if(counter>=array_length_1d(checkbox)) {
            counter=0;
            for(var i=0;i<array_length_1d(checkbox);i++) {
                status[i]=noone;
            }
        }
    } until(checkbox[counter]!=false)
    active[counter]=true;
    status[counter]=script_execute(asset_get_index("scr_solver_"+script[counter]));
	
	do_step=false;
}