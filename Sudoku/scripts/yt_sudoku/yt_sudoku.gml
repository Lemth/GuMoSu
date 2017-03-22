/// @desc sudoku()

yt_create_Puzzle();

yt_setup_Puzzle();

// https://www.youtube.com/watch?v=oUtxBYHrHFY 1:18
while(unsolved>0) {
  progress=yt_check_Puzzle();
  if(progress==0) {
    display_debug_message("Failed to solve the Puzzle!");
    break; 
  }
}
// https://www.youtube.com/watch?v=28lzkKBmyi4


