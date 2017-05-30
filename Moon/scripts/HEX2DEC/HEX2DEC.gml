if(argument0=="*") {
	return 59;
} else if(argument0==".") {
	return 53;
} else if(argument0=="0") {
	return 0;
} else if(argument0=="1") {
	return 1;
} else if(argument0=="2") {
	return 2;
} else if(argument0=="3") {
	return 3;
} else if(argument0=="4") {
	return 4;
} else if(argument0=="5") {
	return 5;
} else if(argument0=="6") {
	return 6;
} else if(argument0=="7") {
	return 7;
} else if(argument0=="8") {
	return 8;
} else if(argument0=="9") {
	return 9;
} else if(argument0=="A") {
	return 10;
} else if(argument0=="B") {
	return 11;
} else if(argument0=="C") {
	return 12;
} else if(argument0=="D") {
	return 13;
} else if(argument0=="E") {
	return 14;
} else if(argument0=="F") {
	return 15;
} else {
	show_debug_message("WRONG HEX2DEC");
	return -1;
}