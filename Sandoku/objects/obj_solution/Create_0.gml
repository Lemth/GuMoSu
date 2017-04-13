//
draw_set_font(font_small);
draw_set_halign(fa_center);
valid=noone;
button=[	"Solution:",noone, //0 1
			"Create",0, //2 3
			"Log",0, //4 5
			"Clipboard:",noone, //6 7
			"Export",0, //8 9
	   		"Import",0, //10 11
	   		"Puzzle:",noone, //12 13
	   		"Solver",0, //14 15
	   		"Brute",0]; //16 17
//

// 0,1,..95 => rows/columns
_order_xy=[	0,1,2,3,	 32,33,34,35, 16,17,18,19,
			4,5,6,7,	 36,37,38,39, 20,21,22,23,
			8,9,10,11,	 40,41,42,43, 24,25,26,27,
			12,13,14,15, 44,45,46,47, 28,29,30,31,
		   
			48,49,50,51, 80,81,82,83, 64,65,66,67,
			52,53,54,55, 84,85,86,87, 68,69,70,71,
			56,57,58,59, 88,89,90,91, 72,73,74,75,
			60,61,62,63, 92,93,94,95, 76,77,78,79,
		   
			16,20,24,28, 0,4,8,12,	  32,36,40,44,
			17,21,25,29, 1,5,9,13,	  33,37,41,45,
			18,22,26,30, 2,6,10,14,	  34,38,42,46,
			19,23,27,31, 3,7,11,15,	  35,39,43,47,
		   
			64,68,72,76, 48,52,56,60, 80,84,88,92,
			65,69,73,77, 49,53,57,61, 81,85,89,93,
			66,70,74,78, 50,54,58,62, 82,86,90,94,
			67,71,75,79, 51,55,59,63, 83,87,91,95];

// matrix indexes
_value_x=[	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
			1,2,3,4,1,2,3,4,1,2,3,4,1,2,3,4,
			1,1,1,1,2,2,2,2,3,3,3,3,4,4,4,4,
			5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,
			1,2,3,4,1,2,3,4,1,2,3,4,1,2,3,4,
			1,1,1,1,2,2,2,2,3,3,3,3,4,4,4,4];
_value_y=[	1,1,1,1,2,2,2,2,3,3,3,3,4,4,4,4,
			0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
			1,2,3,4,1,2,3,4,1,2,3,4,1,2,3,4,
			1,1,1,1,2,2,2,2,3,3,3,3,4,4,4,4,
			5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,
			1,2,3,4,1,2,3,4,1,2,3,4,1,2,3,4];
_value_z=[	1,2,3,4,1,2,3,4,1,2,3,4,1,2,3,4,
			1,1,1,1,2,2,2,2,3,3,3,3,4,4,4,4,
			0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
			1,2,3,4,1,2,3,4,1,2,3,4,1,2,3,4,
			1,1,1,1,2,2,2,2,3,3,3,3,4,4,4,4,
			5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5];

// peers per square
_peers=ds_list_create(); // !REDUCED PEERS!
for(var i=16;i<96;i++) {
	_peers[| i]=ds_list_create();
	for(var j=0;j<i;j++) {
		if(scr_square_is_peer(i,j)) {
			ds_list_add(_peers[| i],j);	
		}
	}
}

// arrays/vectors x/y/z[0,1..5] (4aislesx3+6faces=18)
_arrays=ds_list_create();
for(var i=0;i<18;i++) {
	_arrays[| i]=ds_list_create(); // 16 values for each array
}
for(var i=0;i<96;i++) {
	ds_list_add(_arrays[| _value_x[i]],i); // x[0,1..5] => _arrays[| 0,1..5]
	ds_list_add(_arrays[| _value_y[i]+6],i); // y[0,1..5] => _arrays[| 6,7..11]
	ds_list_add(_arrays[| _value_z[i]+12],i); // z[0,1..5] => _arrays[| 12,13..17]
}

_values=ds_list_create(); // value list to copy values from
ds_list_add(_values,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16);

//INIT ARRAYS
ds_list_shuffle(_values); //1,2..16
for(var i=0;i<96;i++) {
	solution[i]=0;
} 

//INIT DATASTRUCTURES
inventory=ds_list_create(); //inventory of values for each square
library=ds_list_create(); //library of values to replenish inventory with for each square
for(var i=0;i<96;i++) { //starting at 17th (i=16) square (all previous are init with 0)
	inventory[| i]=ds_list_create();
	library[| i]=ds_list_create();
}

scr_solution_create();
