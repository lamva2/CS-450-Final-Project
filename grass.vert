#version 330 compatibility

uniform float       uTime;
uniform float       uXmin, uXmax;
uniform float       uZmin, uZmax;
uniform float       uPeriodx, uPeriodz;
uniform int         uNumx, uNumz;

const float TWOPI = 2.*3.14159265;

void main() {
    int ix = gl_InstanceID % uNumx;
    int iz = gl_InstanceID / uNumx;
    float x = uXmin + float(ix) * (uXmax-uXmin) / float(uNumx-1);
    float z = uZmin + float(iz) * (uZmax-uZmin) / float(uNumz-1);

    //ix += 7;
    //iz += 13;

    float kx = cos( TWOPI * uTime * float(ix) / uPeriodx );
    float kz = sin( TWOPI * uTime * float(iz) / uPeriodz );

    vec4 vert = vec4( x, gl_Vertex.y, z, gl_Vertex.w );
    float ysq = vert.y*vert.y;
    vert.x += kx * ysq;
    vert.z += kz * ysq;

    gl_Position = gl_ModelViewProjectionMatrix * vert;
}
