/// @desc square_is_peer(square1,square2)
/// @arg square1 argument0
/// @arg square2 argument1

if(_value_x[argument0]==_value_x[argument1]) {
	return true;
} else
if(_value_y[argument0]==_value_y[argument1]) {
	return true;
} else 
if(_value_z[argument0]==_value_z[argument1]) {
	return true;
} else {
	return false;
}