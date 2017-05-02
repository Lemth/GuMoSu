/// @desc draw_cube_pos(sprite,index,x,y,w,h,angle);
/// @arg sprite argument0
/// @arg index argument1
/// @arg x argument2
/// @arg y argument3
/// @arg w argument4
/// @arg h argument5
/// @arg angle argument6

var index=0;
var angle=argument6;
var xx1=[0,0,0,0];
var yy1=[0,0,0,0];
var xx2=[0,0,0,0];
var yy2=[0,0,0,0];

for(var i=0;i<4;i++) {

	var x1=argument2+argument4*dsin(angle);
	var x2=argument2+argument4*dsin(angle);
	var x3=argument2+argument4*dcos(angle);
	var x4=argument2+argument4*dcos(angle);
	var y1=argument3-argument4*dsin(angle+90)/2;
	var y2=argument3-argument4*dsin(angle+90)/2+argument5*sqrt(2);
	var y3=argument3-argument4*dcos(angle+90)/2+argument5*sqrt(2);
	var y4=argument3-argument4*dcos(angle+90)/2;

	xx1[i]=x1;
	xx2[i]=x2;
	yy1[i]=y1;
	yy2[i]=y2;

	draw_sprite_pos(argument0,index,x1,y1,x2,y2,x3,y3,x4,y4,1);
	
	angle+=90;
	index++;
}

	draw_sprite_pos(argument0,index,xx1[0],yy1[0],xx1[1],yy1[1],xx1[2],yy1[2],xx1[3],yy1[3],1);
	index++;
	draw_sprite_pos(argument0,index,xx2[0],yy2[0],xx2[1],yy2[1],xx2[2],yy2[2],xx2[3],yy2[3],1);

