#version 100

precision mediump float;

uniform float red;
uniform float green;
uniform float blue;

void main() {
  gl_FragColor = vec4(red, green, blue, 1.0);
}
