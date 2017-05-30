///@desc scr_puzzle_count(puzzle,num)
///@arg puzzle argument0
///@arg num argument1

var a=[argument0[0],argument0[1],argument0[2]];
var i=96-string_count(".",a[1]);
var s=0;

while(i<argument1) {
  var r=irandom(95)+1;
  a[1]=string_set_byte_at(a[1],r,ord(string_char_at(a[0],r)));
  a[2]=string_set_byte_at(a[2],r,ord(string_char_at(a[0],r)));
  i=96-string_count(".",a[1]);
  ++s;
  if(s>1000) {
    break; 
  }
}

return a;
