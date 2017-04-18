/// @desc scr_popcount(number)
/// @arg number argument0

var number=argument0;
var popcount=0;

while(number>0) {
	if(number&1) {
		popcount++;
	}
	number=number>>1;
}
return popcount;