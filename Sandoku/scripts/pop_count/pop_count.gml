/// @desc pop_count(val)
/// @arg val argument0

var c=0;
for(var n=argument0;n>0;n&=n-1) {
	c++;
}
return c;