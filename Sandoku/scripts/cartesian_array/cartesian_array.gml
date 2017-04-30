/// @desc cartesian_array(cartesian)
/// @arg cartesian argument0

var cartesian=argument0

if(pop_state(cartesian&$3F)==1) { //_value_x
	return log2(cartesian&$3F);
} else if (pop_state(cartesian&$FC0)==1) { //_value_y
	return log2(cartesian&$FC0);
} else if (pop_state(cartesian&$3F000)==1) { //_value_z
	return log2(cartesian&$3F000);
} else {
	return false;
}