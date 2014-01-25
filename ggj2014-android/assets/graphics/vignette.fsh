varying vec4 v_color;
varying vec2 v_texCoord0;

uniform vec2 u_resolution;
uniform sampler2D u_sampler2D;

//const float outerRadius = .4, innerRadius = .1, intensity = 0.9;
uniform float outerRadius, innerRadius, intensity;
uniform vec4 tint;

void main() {
	vec4 color = texture2D(u_sampler2D, v_texCoord0) * v_color * tint;

	vec2 relativePosition = gl_FragCoord.xy / u_resolution - .5;
	// relativePosition.x *= u_resolution.x / u_resolution.y;
	float len = length(relativePosition);
	float vignette = smoothstep(outerRadius, innerRadius, len);
	color.rgb = mix(color.rgb, color.rgb * vignette, intensity);

	gl_FragColor = color;
}