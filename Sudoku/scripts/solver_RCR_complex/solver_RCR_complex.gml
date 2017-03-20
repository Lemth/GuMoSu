/// @desc solver_RCR_complex(list)
/// @arg list	argument0 
var status=false;
var status2=false;


var singles=ds_list_create();
var multiples_id=ds_list_create();

for(var i=0;i<27;i++) {
	singles[| i]=ds_list_create();
	multiples_id[| i]=ds_list_create();
}

for(var i=0;i<81;i++) {
	if(ds_list_size(argument0[| i])==1) {
		ds_list_add(singles[| floor(i/9)],ds_list_find_value(argument0[| i],0));
		ds_list_add(singles[| 9+(i mod 9)],ds_list_find_value(argument0[| i],0));	   
		ds_list_add(singles[| 18+floor(i/3 mod 3)+3*floor(i/27)],ds_list_find_value(argument0[| i],0));
        } else {
		ds_list_add(multiples_id[| floor(i/9)],argument0[| i]);
		ds_list_add(multiples_id[| 9+(i mod 9)],argument0[| i]);	   
		ds_list_add(multiples_id[| 18+floor(i/3 mod 3)+3*floor(i/27)],argument0[| i]);
	}
}

for(var i=0;i<27;i++) {
	while(ds_list_size(singles[| i])>0) {
		for(var j=0;j<ds_list_size(multiples_id[| i]);j++) {
			status=ds_list_delete_value(ds_list_find_value(multiples_id[| i],j),ds_list_find_value(singles[| i],0));
			if(status==true) { status2=true; }
		}
		ds_list_delete(singles[| i],0);
	}
}

for(var i=0;i<27;i++) {
	ds_list_destroy(singles[| i]);
	ds_list_destroy(multiples_id[| i]);
}

ds_list_destroy(singles);
ds_list_destroy(multiples_id);

return status2;