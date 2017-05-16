/// @desc scr_convert_string_grid(array,string)
/// @arg array argument0
/// @arg string argument1
for(var i=0;i<96;i++) {
	var char=string_char_at(argument1,i+1);
	if(char==".") {
		argument0[@ i]=16;
	} else if(char=="A") {
		argument0[@ i]=10;
	} else if(char=="B") {
		argument0[@ i]=11;
	} else if(char=="C") {
		argument0[@ i]=12;
	} else if(char=="D") {
		argument0[@ i]=13;
	} else if(char=="E") {
		argument0[@ i]=14;
	} else if(char=="F") {
		argument0[@ i]=15;
	} else {
		argument0[@ i]=real(char);
	}
}