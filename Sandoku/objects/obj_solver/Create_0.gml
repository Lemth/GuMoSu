randomize();

//
draw_set_font(font_small);
draw_set_halign(fa_center);
puzzle_create_mode=0; //1==solver; 2==brute <<==!!
time=0;
valid=noone;
number=0;
for(var i=0;i<39;i++) {
    checkbox[i]=i<3 ? true : false;
    active[i]=false;
    status[i]=noone;
}
solver_names=["1: Hidden Singles","2: Naked Pairs/Triples","3: Hidden Pairs/Triples","4: Naked/Hidden Quads","5: Pointing Pairs","6: Box/Line Reduction","7: X-Wing","8: Simple Colouring","9: Y-Wing","10: Swordfish","11: XYZ Wing","12: X-Cycles","13: BUG","14: XY-Chain","15: 3D Medusa","16: Jellyfish","17: Unique Rectangles","18: Extended Unique Rect.","19: Hidden Unique Rect's","20: WXYZ Wing","21: Aligned Pair Exclusion","22: Exocet","23: Grouped X-Cycles","24: Empty Rectangles","25: Finned X-Wing","26: Finned Swordfish","27: Altern. Interence Chains","28: Sue-de-Cog","29: Digit Forcing Chains","30: Nishio Forcing Chains","31: Cell Forcing Chains","32: Unit Forcing Chains","33: Almost Locked Sets","34: Death Blossom","35: Pattern Overlay Method","36: Quad Forcing Chains","37: Bowman's Bingo"];
script=["check","show","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37"];
counter=0;
automatic=false;
do_step=false;
errormsg="";
file_sandoku_solver=file_text_open_write("sandoku_solver.txt");
file_text_close(file_sandoku_solver);
//

// 0,1,..95 => rows/columns
_order_xy=[	0,1,2,3,		32,36,40,44,	28,24,20,16,
			4,5,6,7,		33,37,41,45,	29,25,21,17,
			8,9,10,11,		34,38,42,46,	30,26,22,18,
			12,13,14,15,	35,39,43,47,	31,27,23,19,
			
			48,49,50,51,	80,84,88,92,	64,68,72,76,
			52,53,54,55,	81,85,89,93,	65,69,73,77,
			56,57,58,59,	82,86,90,94,	66,70,74,78,
			60,61,62,63,	83,87,91,95,	67,71,75,79,
			
			16,17,18,19,	0,4,8,12,		35,34,33,32,
			20,21,22,23,	1,5,9,13,		39,38,37,36,
			24,25,26,27,	2,6,10,14,		43,42,41,40,
			28,29,30,31,	3,7,11,15,		47,46,45,44,
			
			64,65,66,67,	60,56,52,48,	80,81,82,83,
			68,69,70,71,	61,57,53,49,	84,85,86,87,
			72,73,74,75,	62,58,54,50,	88,89,90,91,
			76,77,78,79,	63,59,55,51,	92,93,94,95];	

// matrix indexes
_value_x=[	1,2,3,4,1,2,3,4,1,2,3,4,1,2,3,4,
			1,2,3,4,1,2,3,4,1,2,3,4,1,2,3,4,
			0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
			1,2,3,4,1,2,3,4,1,2,3,4,1,2,3,4,
			1,2,3,4,1,2,3,4,1,2,3,4,1,2,3,4,
			5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5];
_value_y=[	1,1,1,1,2,2,2,2,3,3,3,3,4,4,4,4,
			0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
			1,1,1,1,2,2,2,2,3,3,3,3,4,4,4,4,
			4,4,4,4,3,3,3,3,2,2,2,2,1,1,1,1,
			5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,
			1,1,1,1,2,2,2,2,3,3,3,3,4,4,4,4];
_value_z=[	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
			4,4,4,4,3,3,3,3,2,2,2,2,1,1,1,1,
			4,3,2,1,4,3,2,1,4,3,2,1,4,3,2,1,
			5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,
			1,1,1,1,2,2,2,2,3,3,3,3,4,4,4,4,
			1,2,3,4,1,2,3,4,1,2,3,4,1,2,3,4];
			

// cartisan per square
_cartesian=ds_list_create();
for(var i=0;i<96;i++) {
	_cartesian[| i]=(1<<_value_x[i])+(1<<(_value_y[i]+6))+(1<<(_value_z[i]+12));
}

// peers per square
_peers=ds_list_create(); //
for(var i=0;i<96;i++) {
	_peers[| i]=ds_list_create();
	for(var j=0;j<96;j++) {
		if(i!=j && scr_square_is_peer(i,j)) {
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
	puzzle[i]=0;
} 

//INIT DATASTRUCTURES
inventory=ds_list_create(); //inventory of values for each square
coloring=ds_list_create();
squarecolor=ds_list_create();
solvedsquare=ds_list_create();
for(var i=0;i<96;i++) { //
	inventory[| i]=solution[i]==0 ? $FFFF : power(2,solution[i]-1);
	coloring[| i]=ds_list_create();
	var clr=coloring[| i];
	for(var j=0;j<16;j++) {
		clr[| j]=0;
	}
	squarecolor[| i]=0;
	solvedsquare[| i]=-1;
}


