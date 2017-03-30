// CLEANUP DATASTRUCTURES
for(var i=0;i<96;i++) {
	if(i<12) {
		if (i<6) {
			ds_list_destroy(regions[| i]);
		}
		ds_list_destroy(columns[| i]);
	}
	ds_list_destroy(squares[| i]);
}
ds_list_destroy(get_column2);
ds_list_destroy(get_column1);
ds_list_destroy(get_region);
ds_list_destroy(columns);
ds_list_destroy(regions);
ds_list_destroy(squares);