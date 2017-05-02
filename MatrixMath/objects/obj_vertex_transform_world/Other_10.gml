//world transform
for (var i = 0; i < 4; i ++)
{
    if (multiplication_order)
    {
        output[i] = 0;
        for (var j = 0; j < 4; j++)
        { output[i] += input[j] * obj_world_matrix.matrix[j*4+i]; }
    }
    else
    {
        output[i] = 0;
        for (var j = 0; j < 4; j++)
        { output[i] += input[j] * obj_world_matrix.matrix[i*4+j]; }    
    }


}

//view transform
for (var i = 0; i < 4; i++)
{
        output[i+4] = 0;
        for (var j = 0; j < 4; j++)
        { output[i+4] += output[j] * obj_view_matrix.matrix[j*4+i]; }
}

//projection transform
for (var i = 0; i < 4; i++)
{
        output[i+8] = 0;
        for (var j = 0; j < 4; j++)
        { output[i+8] += output[j+4] * obj_projection_matrix.matrix[j*4+i]; }
}

//divide by w component
if (output[11] != 0)
{
    for (var i = 0; i < 4; i++)
    { output[i+12] = output[i+8] / output[11]; }
}
else
{
    for (var i = 0; i < 4; i++)
    { output[i+12] = 0; }
}

if ((abs(output[12]) > 1) or (abs(output[13]) > 1) or (output[14] < 0) or (output[14] > 1))
    vertex_in_view = false;
else
    vertex_in_view = true;

//viewport coordinates
output[16] = (output[12] + 1) * 500 / 2;
output[17] = (output[13] + 1) * 400 / 2;

//update output cells
for (var i = 0; i < 18; i++)
{
    with (list_output_cells[|i])
    {
        value = other.output[i];
        text = string(value);
    }
}



