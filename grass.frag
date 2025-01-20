#version 330 compatibility

const vec4 GRASSCOLOR = vec4(  0.05f, 0.10f, 0.20f, 1. ); // grass (r,g,b) color

void main() {
    gl_FragColor = GRASSCOLOR; // Output color to framebuffer
}