// CREATE DATASTRUCTURES
square=ds_list_create();
xx=ds_list_create();
yy=ds_list_create();
zz=ds_list_create();
for(var i=0;i<6;i++) {
    xx[| i]=ds_list_create();
    yy[| i]=ds_list_create();
    zz[| i]=ds_list_create();
}
for(var i=0;i<32;i++) {
    square[| i]=ds_map_create();
    ds_map_add(square[| i],"nn",ds_list_create());
    ds_list_add(ds_map_find_value(square[| i],"nn"),1,2,3,4,5,6,7,8);ds_list_add(ds_map_find_value(square[| i],"nn"),9,10,11,12,13,14,15,16);
    ds_list_shuffle(ds_map_find_value(square[| i],"nn"));
    ds_map_add(square[| i],"xx",xx[| floor(i/16)*5]);
    ds_map_add(square[| i],"yy",yy[| (floor(i/4) mod 4)+1]);
    ds_map_add(square[| i],"zz",zz[| (i mod 4)+1]);
    ds_map_add(square[| i],"ss",i);
    ds_list_add(xx[| floor(i/16)*5],square[| i]);
    ds_list_add(yy[| (floor(i/4) mod 4)+1],square[| i]);
    ds_list_add(zz[| (i mod 4)+1],square[| i]);
}
for(var i=32;i<64;i++) {
    square[| i]=ds_map_create();
    ds_map_add(square[| i],"nn",ds_list_create());
    ds_list_add(ds_map_find_value(square[| i],"nn"),1,2,3,4,5,6,7,8);ds_list_add(ds_map_find_value(square[| i],"nn"),9,10,11,12,13,14,15,16);
    ds_list_shuffle(ds_map_find_value(square[| i],"nn"));
    ds_map_add(square[| i],"xx",xx[| (i mod 4)+1]);
    ds_map_add(square[| i],"yy",yy[| floor((i-32)/16)*5]);
    ds_map_add(square[| i],"zz",zz[| (floor(i/4) mod 4)+1]);
    ds_map_add(square[| i],"ss",i);
    ds_list_add(xx[| (i mod 4)+1],square[| i]);
    ds_list_add(yy[| floor((i-32)/16)*5],square[| i]);
    ds_list_add(zz[| (floor(i/4) mod 4)+1],square[| i]);
}
for(var i=64;i<96;i++) {
    square[| i]=ds_map_create();
    ds_map_add(square[| i],"nn",ds_list_create());
    ds_list_add(ds_map_find_value(square[| i],"nn"),1,2,3,4,5,6,7,8);ds_list_add(ds_map_find_value(square[| i],"nn"),9,10,11,12,13,14,15,16);
    ds_list_shuffle(ds_map_find_value(square[| i],"nn"));
    ds_map_add(square[| i],"xx",xx[| (floor(i/4) mod 4)+1]);
    ds_map_add(square[| i],"yy",yy[| (i mod 4)+1]);
    ds_map_add(square[| i],"zz",zz[| floor((i-64)/16)*5]);
    ds_map_add(square[| i],"ss",i);
    ds_list_add(xx[| (floor(i/4) mod 4)+1],square[| i]);
    ds_list_add(yy[| (i mod 4)+1],square[| i]);
    ds_list_add(zz[| floor((i-64)/16)*5],square[| i]);
}

for(var i=0;i<96;i++) {
    solution[i]=0;
}

sq=0;
step=0;

while(sq<96) {
    //START
    step++;
    if(step>1000000) { //Safety net (at 4th STD DEV)
        for(var i=0;i<96;i++) {
            ds_list_clear(ds_map_find_value(square[| i],"nn"));
            ds_list_add(ds_map_find_value(square[| i],"nn"),1,2,3,4,5,6,7,8);ds_list_add(ds_map_find_value(square[| i],"nn"),9,10,11,12,13,14,15,16);
            ds_list_shuffle(ds_map_find_value(square[| i],"nn"));
            solution[i]=0;
        }
        sq=0;
        step=0;
        continue;
    }
    //Get a number randomly from the available numbers
    solution[sq]=ds_list_find_value(ds_map_find_value(square[| sq],"nn"),0);
    //Are we out of Numbers?
    if(is_undefined(solution[sq])) {
        //Replenish this squares numbers and go back 1 square
        ds_list_add(ds_map_find_value(square[| sq],"nn"),1,2,3,4,5,6,7,8);ds_list_add(ds_map_find_value(square[| sq],"nn"),9,10,11,12,13,14,15,16);
        ds_list_shuffle(ds_map_find_value(square[| sq],"nn"));
        sq--;
        continue;
    }
    //Use it!
    ds_list_delete(ds_map_find_value(square[| sq],"nn"),0);
    //Does it Conflict?
    if(sudoku_create_solution_check_conflict(sq)) {
        //Remove from available numbers for this square
        continue;
    }
    sq++;
}

// CLEANUP DATASTRUCTURES
for(var i=0;i<96;i++) {
    if(i<6) {
        ds_list_destroy(xx[| i]);
        ds_list_destroy(yy[| i]);
        ds_list_destroy(zz[| i]);
    }
    ds_list_destroy(ds_map_find_value(square[| i],"nn"));
    ds_map_destroy(square[| i]);
}
ds_list_destroy(xx);
ds_list_destroy(yy);
ds_list_destroy(zz);
ds_list_destroy(square);
