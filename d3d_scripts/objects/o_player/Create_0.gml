/// @description Init player

z=16;
dir=0;

// Create target variables for movement
target_dir=dir;
target_x=x;
target_y=y;

// Set the default draw color to white
draw_set_color(c_white);

// Start 3D drawing
d3d_start();

// Set the fog
dark_purple=make_color_rgb(27,3,59);
d3d_set_fog(true,dark_purple,16,128);

fov = 75
render_distance = 320

sensitivity = 0.1;
terminal_velocity = 2;
acceleration = 0.1;
jump_height = 6;
v_velocity = 0;
h_velocity = 0;
d_velocity = 0;
gravitation = 0.5

height = 32;

pitch = 0;

gamepad_set_axis_deadzone(0,0.1)
