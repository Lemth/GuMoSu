///@desc vertex_build_cube_face(vbuff,x1,y1,z1,x2,y2,z2)
///@arg vbuff argument0
///@arg x1 argument1
///@arg y1 argument2
///@arg z1 argument3
///@arg x2 argument4
///@arg y2 argument5
///@arg z2 argument6

if(argument1==argument4) {
    for(var i=0;i<4;++i) {
        for(var j=0;j<4;++j) {
            vertex_build_cube_square(argument0, 
			argument1,lerp(argument2,argument5,.25*i),lerp(argument3,argument6,.25*j),
			argument4,lerp(argument2,argument5,.25*(i+1)),lerp(argument3,argument6,.25*(j+1)));
        }
    }
}
if(argument2==argument5) {
    for(var j=0;j<4;++j) {
        for(var i=0;i<4;++i) {
            vertex_build_cube_square(argument0, 
			lerp(argument1,argument4,.25*(3-i)),argument2,lerp(argument3,argument6,.25*j),
			lerp(argument1,argument4,.25*(4-i)),argument5,lerp(argument3,argument6,.25*(j+1)));
        }
    }
}
if(argument3==argument6) {
    for(var j=0;j<4;++j) {
        for(var i=0;i<4;++i) {
            vertex_build_cube_square(argument0, 
			lerp(argument1,argument4,.25*i),lerp(argument2,argument5,.25*j),argument3,
			lerp(argument1,argument4,.25*(i+1)),lerp(argument2,argument5,.25*(j+1)),argument6);
        }
    }
}