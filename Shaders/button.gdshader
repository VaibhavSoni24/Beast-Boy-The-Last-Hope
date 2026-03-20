shader_type canvas_item;

uniform float glow_strength : hint_range(0.0, 5.0) = 1.6;
uniform float glow_size : hint_range(0.0, 10.0) = 3.5;
uniform vec4 glow_color : source_color = vec4(1.0, 1.0, 1.0, 1.0);

uniform float pulse_speed = 2.0;
uniform float pulse_strength = 0.2;
uniform float flicker_strength = 0.04;

uniform float animate = 0.0; // 0 = off, 1 = on

void fragment() {
    vec4 tex = texture(TEXTURE, UV);
    float alpha = tex.a;

    // ===== TIME EFFECTS =====
    float flicker = fract(sin(TIME * 12.0) * 43758.5453) * flicker_strength;
    float pulse = 1.0;
	if (animate > 0.5) {
		float flicker = fract(sin(TIME * 12.0) * 43758.5453) * flicker_strength;
		pulse = 1.0 + sin(TIME * pulse_speed) * pulse_strength + flicker;
		}

    // ===== SOFT GLOW SAMPLING =====
    float glow = 0.0;
    float total = 0.0;

    // 7x7 kernel (optimized vs 9x9, still strong)
    for (int x = -3; x <= 3; x++) {
        for (int y = -3; y <= 3; y++) {

            vec2 offset = vec2(float(x), float(y)) * TEXTURE_PIXEL_SIZE * glow_size;

            float dist = length(vec2(float(x), float(y)));
            float weight = exp(-dist * 0.7); // exponential falloff (better than linear)

            float sample_alpha = texture(TEXTURE, UV + offset).a;

            glow += sample_alpha * weight;
            total += weight;
        }
    }

    glow /= total;

    // ===== SHARPER CORE + SOFT EDGE =====
    float core = alpha;
    float halo = max(glow - core, 0.0);

    // ===== EMISSION =====
    vec3 emission = glow_color.rgb * halo * glow_strength * pulse;

    // ===== FINAL COLOR =====
    COLOR.rgb = tex.rgb + emission;
    COLOR.a = max(alpha, glow * 0.5);
}