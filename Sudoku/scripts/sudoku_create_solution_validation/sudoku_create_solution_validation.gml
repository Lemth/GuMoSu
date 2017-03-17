/// @desc sudoku_create_solution_validation()

checkgrid=ds_grid_create(9,9);

for(j=0;j<9;j++) {
	for(i=0;i<9;i++) {
		ds_grid_add(checkgrid,i,j,solution[j*9+i]);
	}
}

//check rows
for(j=0;j<9;j++) {
	if(ds_grid_get_max(checkgrid,0,j,8,j)!=9) { show_message("Wrong Max in Row "+string(j)); }
	if(ds_grid_get_min(checkgrid,0,j,8,j)!=1) { show_message("Wrong Min in Row "+string(j)); }
	if(ds_grid_get_mean(checkgrid,0,j,8,j)!=5) { show_message("Wrong Mean in Row "+string(j)); }
	if(ds_grid_get_sum(checkgrid,0,j,8,j)!=45) { show_message("Wrong Sum in Row "+string(j)); }
	if(checkgrid[# 0,j]*checkgrid[# 1,j]*checkgrid[# 2,j]*checkgrid[# 3,j]*checkgrid[# 4,j]*checkgrid[# 5,j]*checkgrid[# 6,j]*checkgrid[# 7,j]*checkgrid[# 8,j]!=362880) { show_message("Wrong Multiple in Row "+string(j)); }
}

//check columns
for(i=0;i<9;i++) {
	if(ds_grid_get_max(checkgrid,i,0,i,8)!=9) { show_message("Wrong Max in Column "+string(i)); }
	if(ds_grid_get_min(checkgrid,i,0,i,8)!=1) { show_message("Wrong Min in Column "+string(i)); }
	if(ds_grid_get_mean(checkgrid,i,0,i,8)!=5) { show_message("Wrong Mean in Column "+string(i)); }
	if(ds_grid_get_sum(checkgrid,i,0,i,8)!=45) { show_message("Wrong Sum in Column "+string(i)); }
	if(checkgrid[# i,0]*checkgrid[# i,1]*checkgrid[# i,2]*checkgrid[# i,3]*checkgrid[# i,4]*checkgrid[# i,5]*checkgrid[# i,6]*checkgrid[# i,7]*checkgrid[# i,8]!=362880) { show_message("Wrong Multiple in Column "+string(j)); }
}

//check regions
for(j=0;j<9;j+=3) {
	for(i=0;i<9;i+=3) {
		if(ds_grid_get_max(checkgrid,i,j,i+2,j+2)!=9) { show_message("Wrong Max in Region "+string(j+i/3)); }
		if(ds_grid_get_min(checkgrid,i,j,i+2,j+2)!=1) { show_message("Wrong Min in Region "+string(j+i/3)); }
		if(ds_grid_get_mean(checkgrid,i,j,i+2,j+2)!=5) { show_message("Wrong Mean in Region "+string(j+i/3)); }
		if(ds_grid_get_sum(checkgrid,i,j,i+2,j+2)!=45) { show_message("Wrong Sum in Region "+string(j+i/3)); }
		if(checkgrid[# i,j]*checkgrid[# i,j+1]*checkgrid[# i,j+2]*checkgrid[# i+1,j]*checkgrid[# i+1,j+1]*checkgrid[# i+1,j+2]*checkgrid[# i+2,j]*checkgrid[# i+2,j+1]*checkgrid[# i+2,j+2]!=362880) { show_message("Wrong Multiple in Region "+string(j+i/3)); }
	}
}

ds_grid_destroy(checkgrid);