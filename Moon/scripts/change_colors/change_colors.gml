/*for(var i=0;i<6;i++) {
    colors[i]=make_color_hsv(irandom(255),100+irandom(100),100+irandom(100));
}*/
switch(irandom(1)) {
    case 1: 
        scr_convert_string_grid(puzzle,"702ACF3568E19DB451B839A270D4CFE6D02164A738CF9B5EEB58271904FDAC63F34D6E51A89CB2074E98CDB51672FA30");
        break;
    default:
        scr_convert_string_grid(puzzle,".0.ACF...8E1..............D.C..........7.8CF..5E.B..2.19.4.....3F....E.1A8..B..74.....B..6.2..30");
        break;
}
vertex_delete_buffer(vbuff);
counter=0;
vertex_cube();