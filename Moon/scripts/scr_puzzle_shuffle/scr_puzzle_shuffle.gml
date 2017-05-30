///@desc scr_puzzle_shuffle(puzzle)
///@arg puzzle argument0

var a=[argument0[0],argument0[1],argument0[2]];
var r=ds_list_create();
ds_list_add(r,"0","1","2","3","4","5","6","7","8","9","A","B","C","D","E","F");
ds_list_shuffle(r);

for(var i=1;i<=string_length(a[0]);++i) {  
  if(HEX2DEC(string_char_at(a[0],i))>=0 && HEX2DEC(string_char_at(a[0],i))<16) {
    var o=ord(r[| HEX2DEC(string_char_at(a[0],i))]);
    a[0]=string_set_byte_at(a[0],i,o);
    if(string_char_at(a[1],i)!=".") {
      a[1]=string_set_byte_at(a[1],i,o);
    }
    if(string_char_at(a[2],i)!=".") {
      a[2]=string_set_byte_at(a[2],i,o);
    }
  }
}

ds_list_destroy(r);
return a;
