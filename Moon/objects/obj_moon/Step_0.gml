if(mouse_check_button_pressed(mb_left)) {
	handleMouseDown();
}
if(mouse_check_button_released(mb_left)) {
	handleMouseUp();
}
if(mouse_check_button(mb_left)) { 
	handleMouseMove();
}
