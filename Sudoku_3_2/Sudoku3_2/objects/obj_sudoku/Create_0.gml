draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_black);
randomize();
file=file_text_open_write("sudokutimes.txt");
file_text_close(file);
time=get_timer()/1000;
counter=0;

//sudoku(); 
/*
back=ds_list_create();
ds_list_add(back,3,7,11,15,2,6,10,14,1,5,9);ds_list_add(back,13,0,4,8,12,28,24,20,16,29);ds_list_add(back,25,21,17,30,26,22,18,31,27);ds_list_add(back,23,19,32,36,40,44,33,37,41);ds_list_add(back,45,34,38,42,46,35,39,43,47);ds_list_add(back,63,59,55,51,62,58,54,50,61);ds_list_add(back,57,53,49,60,56,52,48,64,68);ds_list_add(back,72,76,65,69,73,77,66,70,74);ds_list_add(back,78,67,71,75,79,95,91,87,83);ds_list_add(back,94,90,86,82,93,89,85,81,92);ds_list_add(back,88,84,80);
for(var i=0;i<ds_list_size(back);i++) {loopback[i]=back[| i];}ds_list_destroy(back);
*/
fwd=ds_list_create();
ds_list_add(fwd,0,4,8,12,16,20,24,28,32,33,34,35);ds_list_add(fwd,48,49,50,51,1,5,9,13,17,21,25,29);ds_list_add(fwd,36,37,38,39,52,53,54,55,2,6,10,14);ds_list_add(fwd,18,22,26,30,40,41,42,43,56,57,58,59);ds_list_add(fwd,3,7,11,15,19,23,27,31,44,45,46,47);ds_list_add(fwd,60,61,62,63,64,68,72,76,80,84,88,92);ds_list_add(fwd,0,1,2,3,16,17,18,19,65,69,73,77);ds_list_add(fwd,81,85,89,93,4,5,6,7,20,21,22,23);ds_list_add(fwd,66,70,74,78,82,86,90,94,8,9,10,11);ds_list_add(fwd,24,25,26,27,67,71,75,79,83,87,91,95);ds_list_add(fwd,12,13,14,15,28,29,30,31,32,36,40,44);ds_list_add(fwd,48,52,56,60,64,65,66,67,80,81,82,83);ds_list_add(fwd,33,37,41,45,49,53,57,61,68,69,70,71);ds_list_add(fwd,84,85,86,87,34,38,42,46,50,54,58,62);ds_list_add(fwd,72,73,74,75,88,89,90,91,35,39,43,47);ds_list_add(fwd,51,55,59,63,76,77,78,79,92,93,94,95);
for(var i=0;i<ds_list_size(fwd);i++) {loopback[i]=fwd[| i];}ds_list_destroy(fwd);

time1=get_timer()/1000;

/* */
/*  */
