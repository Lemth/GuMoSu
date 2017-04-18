if(automatic) {
    active[counter]=false;
    if(status[counter]!="No" && status[counter]!=0) {
        counter=-1;
        for(var i=0;i<39;i++) {
            status[i]=noone;
        }
    }    
    do {
        counter++;
        if(counter>=39) {
            counter=0;
            for(var i=0;i<39;i++) {
                status[i]=noone;
            }
        }
    } until(checkbox[counter]!=false)
    active[counter]=true;
    status[counter]=choose("Yes","No",irandom(3),0,0);
}