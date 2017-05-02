/// @description Insert description here
// You can write your code in this editor

if(keyboard_check_pressed(vk_up)) {
	var vect_x=lengthdir_x(32,target_dir);
	var vect_y=lengthdir_y(32,target_dir);
	if(!place_meeting(target_x+vect_x,target_y+vect_y,o_wall)) {
		target_x+=vect_x;
		target_y+=vect_y;
	}
}

if(keyboard_check_pressed(vk_down)) {
	var vect_x=lengthdir_x(32,target_dir);
	var vect_y=lengthdir_y(32,target_dir);
	if(!place_meeting(target_x-vect_x,target_y-vect_y,o_wall)) {
		target_x-=vect_x;
		target_y-=vect_y;
	}
}

if(keyboard_check_pressed(vk_right)) {
	target_dir-=90;
}

if(keyboard_check_pressed(vk_left)) {
	target_dir+=90;
}

dir=lerp(dir,target_dir,.1);
x=lerp(x,target_x,.1);
y=lerp(y,target_y,.1);

