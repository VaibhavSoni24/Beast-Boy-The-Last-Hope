shader_type canvas_item;

uniform float progress : hint_range(0.0, 1.0) = 0.0;
uniform vec4 curtain_color : source_color = vec4(0.0, 0.0, 0.0, 1.0);
uniform vec4 glow_color : source_color = vec4(0.92, 0.97, 1.0, 1.0);

uniform float slit_feather = 0.018;
uniform float glow_width = 0.08;
uniform float ray_strength = 0.20;
uniform float ray_count = 46.0;
uniform float ray_speed = 1.5;

void fragment() {
	float p = clamp(progress, 0.0, 1.0);

	// 0.0 = fully open, 1.0 = fully closed.
	// When open, the slit is wider than the screen, so the overlay disappears.
	float half_open = mix(0.52, 0.0, p);

	float x = abs(UV.x - 0.5);
	float slit = 1.0 - smoothstep(half_open, half_open + slit_feather, x);

	// Dark curtain body.
	float alpha = 1.0 - slit;

	// Soft glow at the moving edge.
	float edge_dist = abs(x - half_open);
	float edge_glow = exp(-(edge_dist * edge_dist) / max(glow_width * glow_width, 0.0001));

	// Light rays inside the slit.
	float rays = sin((UV.y * ray_count) + TIME * ray_speed) * 0.5 + 0.5;
	rays = pow(rays, 7.0) * slit;

	// Subtle center bloom.
	float center_bloom = exp(-(x * x) / 0.0025) * slit;

	vec3 col = curtain_color.rgb;
	col += glow_color.rgb * (edge_glow * 0.95);
	col += glow_color.rgb * (rays * ray_strength);
	col += glow_color.rgb * (center_bloom * 0.4);

	COLOR = vec4(col, alpha);
}