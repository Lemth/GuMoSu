
///@desc scr_puzzle_prime()
group[17]=[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
groupnumber[95]=0;

group[0]=[63,62,61,60,32,33,34,35,0,1,2,3,80,81,82,83];
group[1]=[59,58,57,56,36,37,38,39,4,5,6,7,84,85,86,87];
group[2]=[55,54,53,52,40,41,42,43,8,9,10,11,88,89,90,91];
group[3]=[51,50,49,48,44,45,46,47,12,13,14,15,92,93,94,95];
group[4]=[16,20,24,28,0,4,8,12,64,68,72,76,48,52,56,60];
group[5]=[17,21,25,29,1,5,9,13,65,69,73,77,49,53,57,61];
group[6]=[18,22,26,30,2,6,10,14,66,70,74,78,50,54,58,62];
group[7]=[19,23,27,31,3,7,11,15,67,71,75,79,51,55,59,63];
group[8]=[79,78,77,76,44,40,36,32,16,17,18,19,83,87,91,95];
group[9]=[75,74,73,72,45,41,37,33,20,21,22,23,82,86,90,94];
group[10]=[71,70,69,68,46,42,38,34,24,25,26,27,81,85,89,93];
group[11]=[67,66,65,64,47,43,39,35,28,29,30,31,80,84,88,92];
group[12]=[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15];
group[13]=[16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31];
group[14]=[32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47];
group[15]=[48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63];
group[16]=[64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79];
group[17]=[80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95];

for(var i=0;i<array_length_1d(group);++i) {
  var g=group[i];
  for(var j=0;j<array_length_1d(g);++j) {
    groupnumber[g[j]]=i;
  }
}


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
