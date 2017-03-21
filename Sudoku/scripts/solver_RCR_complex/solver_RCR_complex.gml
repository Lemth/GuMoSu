/// @desc solver_RCR_complex(list)
/// @arg list	argument0 

//INIT
var test=false;
var status=false;

//BEGIN
var singles_value=ds_list_create();
var multiples_id=ds_list_create();
for(var i=0;i<27;i++) {
	singles_value[| i]=ds_list_create();
	multiples_id[| i]=ds_list_create();
}
//BEGIN

//Gather RCR filter
for(var i=0;i<81;i++) {
	if(ds_list_size(argument0[| i])==1) {
		ds_list_add(singles_value[| floor(i/9)],						ds_list_find_value(argument0[| i],0));
		ds_list_add(singles_value[| 9+(i mod 9)],						ds_list_find_value(argument0[| i],0));	   
		ds_list_add(singles_value[| 18+floor(i/3 mod 3)+3*floor(i/27)],	ds_list_find_value(argument0[| i],0));
        } else {
		ds_list_add(multiples_id[|	floor(i/9)],						argument0[| i]);
		ds_list_add(multiples_id[|	9+(i mod 9)],						argument0[| i]);	   
		ds_list_add(multiples_id[|	18+floor(i/3 mod 3)+3*floor(i/27)],	argument0[| i]);
	}
}

//Apply RCR filter
for(var i=0;i<27;i++) {
	while(ds_list_size(singles_value[| i])>0) {
		for(var j=0;j<ds_list_size(multiples_id[| i]);j++) {
			test=ds_list_delete_value(ds_list_find_value(multiples_id[| i],j),ds_list_find_value(singles_value[| i],0));
			if(test==true) { status=true; }
		}
		ds_list_delete(singles_value[| i],0);
	}
	ds_list_destroy(singles_value[| i]);
	ds_list_destroy(multiples_id[| i]);
}

//END
ds_list_destroy(singles_value);
ds_list_destroy(multiples_id);
//END

return false;
