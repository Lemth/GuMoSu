///@desc scr_puzzle_check(puzzle)

var r=-1;

for(var i=0;i<array_length_1d(group);++i) { // loop through each group
  var g=group[i];
  var l=-1;
  for(var j=0;j<array_length_1d(g);++j) { // loop through each square
    if(string_char_at(argument0[2],g[j])==".") {
      break; // break if empty field somewhere
    }
    if(string_char_at(argument0[2],g[j])!=string_char_at(argument0[0],g[j])) {
      l=i; // note if there is a mistake
    }
    if(j==array_length_1d(g)-1 && l!=-1) {
      r=l; // all filled in and mistake? report mistake.
    }
  }
}

return r;
