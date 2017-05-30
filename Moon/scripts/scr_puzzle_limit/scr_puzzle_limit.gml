///@desc scr_puzzle_limit(puzzle,num)
///@arg puzzle argument0
///@arg num argument1

var a=[argument0[0],argument0[1],argument0[2]];

for(var i=1;i<=string_length(a[0]);++i) {
  if(HEX2DEC(string_char_at(a[0],i))>=argument1) {
    a[0]=string_set_byte_at(a[0],i,ord("*"));
    a[1]=string_set_byte_at(a[1],i,ord("*"));
    a[2]=string_set_byte_at(a[2],i,ord("*"));
  }
}

return a;
