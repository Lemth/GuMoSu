//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec4 pos;

void main()
{
    vec4 object_space_pos = (gm_Matrices[MATRIX_WORLD] * pos) + vec4(in_Position.xyz,0.0);
    gl_Position = gm_Matrices[MATRIX_PROJECTION] * gm_Matrices[MATRIX_VIEW] * object_space_pos;

    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
}

