#version 120    
uniform sampler2D tex0;
uniform float border; // 0.01
uniform float circle_radius; // 0.5    
void main (void)
{
  vec2 uv = gl_TexCoord[0].xy;
  
  vec4 bkg_color = texture2D(tex0,uv * vec2(1.0, -1.0));

  // Offset uv with the center of the circle.
  uv -= vec2(0.5, 0.5);
  
  float dist =  sqrt(dot(uv, uv));
  if ( (dist > (circle_radius+border)) || (dist < (circle_radius-border)) )
    gl_FragColor = bkg_color;
  else 
    gl_FragColor = vec4(1.0, 1.0, 1.0, 1.0);
}