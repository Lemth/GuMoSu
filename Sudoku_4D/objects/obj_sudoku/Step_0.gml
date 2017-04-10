if(test1==0) {
	sdk_solver(inventory);
	var count=0;
	for(var i=0;i<96;i++) {
		if(ds_list_size(inventory[| i])==1) {
			solution[i]=ds_list_find_value(inventory[| i],0);
			count++;
		} else {
			solution[i]=0;
		}
		check[i]=ds_list_size(inventory[| i]);
	}
	if(count==96) {
		sudoku_create_solution_validate();
		test1=1;
	}
}

if(keyboard_check_pressed(vk_space)) {
	var rand=irandom(64);
	ds_list_clear(inventory[| _order_xy[rand]]);
	ds_list_add(inventory[| _order_xy[rand]],test5[rand]);
	var catch=sdk_update_for_solved_cell(inventory,_order_xy[rand]);
	if(catch==-1) {
		return -1;
	}
}
