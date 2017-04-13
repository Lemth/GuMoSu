/// @desc scr_convert_grid_string(array)
/// @arg array argument0
var str="";
for(var i=0;i<96;i++) {
	switch(argument0[i]) {
		case 0:		str+=".";
break;	case 11:	str+="A";
break;	case 12:	str+="B";
break;	case 13:	str+="C";
break;	case 14:	str+="D";
break;	case 15:	str+="E";
break;	case 16:	str+="F";
break;	default:	str+=string(argument0[i]-1);
		break;
	}
}
if(string_length(str)==96) {
	return str;
} else {
	return ("ERROR: wrong string length ("+string(string_length(str))+").");
}
	