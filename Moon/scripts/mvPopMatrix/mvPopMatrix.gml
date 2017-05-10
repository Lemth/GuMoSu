///@desc mvPopMatrix

if(matrix_stack_is_empty()) {
	show_debug_message("Invalid popMatrix!");
}
matrix_stack_pop();
mvMatrix = matrix_get(matrix_world);