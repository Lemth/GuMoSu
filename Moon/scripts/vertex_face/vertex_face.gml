if(argument1==argument4) {
    for(var i=0;i<4;i++) {
        for(var j=0;j<4;j++) {
            vertex_square(argument0, 
                            argument1, 
                            lerp(argument2,argument5,.25*i),
                            lerp(argument3,argument6,.25*j),
                            argument4, 
                            lerp(argument2,argument5,.25*(i+1)), 
                            lerp(argument3,argument6,.25*(j+1)));
        }
    }
}
if(argument2==argument5) {
    for(var i=0;i<4;i++) {
        for(var j=0;j<4;j++) {
            vertex_square(argument0, 
                            lerp(argument1,argument4,.25*i), 
                            argument2,
                            lerp(argument3,argument6,.25*j),
                            lerp(argument1,argument4,.25*(i+1)), 
                            argument5, 
                            lerp(argument3,argument6,.25*(j+1)));
        }
    }
}
if(argument3==argument6) {
    for(var j=0;j<4;j++) {
        for(var i=0;i<4;i++) {
            vertex_square(argument0, 
                            lerp(argument1,argument4,.25*i), 
                            lerp(argument2,argument5,.25*j),
                            argument3,
                            lerp(argument1,argument4,.25*(i+1)), 
                            lerp(argument2,argument5,.25*(j+1)), 
                            argument6);
        }
    }
}