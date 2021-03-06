if(test1==0) {
	sdk_solver(inventory);
	var count=0;
	for(var i=0;i<96;i++) {
		if(ds_list_size(inventory[| i])==1) {
			solution[i]=ds_list_find_value(inventory[| i],0);
			count++;
		} else if (ds_list_size(inventory[| i])==0) {
			show_debug_message("!!!w00ps solving went wrong. possibly unsolvable.");
			test1=1;
		} else {
			solution[i]=0;
		}
		check[i]=ds_list_size(inventory[| i]);
	}
	if(count==96) {
		show_debug_message("!!!all filled in");
		sudoku_create_solution_validate();
		test1=1;
		show_debug_message("!!!complete");
	}
}

if(keyboard_check_pressed(vk_space)) {
	do { var rand=irandom(array_length_1d(_order_xy)-1); 
	} until (ds_list_size(inventory[| _order_xy[rand]])>1)
	ds_list_clear(inventory[| _order_xy[rand]]);
	ds_list_add(inventory[| _order_xy[rand]],test5[rand]);
	var catch=sdk_update_for_solved_cell(inventory,_order_xy[rand]);
	if(catch==-1) { return -1; }
}
