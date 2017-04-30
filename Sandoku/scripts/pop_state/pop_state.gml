/// @desc pop_state(val)
/// @arg val argument0

if(is_undefined(argument0)) {
	return -1;
} else if(argument0==0) {
	return 0;
} else if ((argument0&(argument0-1))==0) {
	return 1;
}
return 2;