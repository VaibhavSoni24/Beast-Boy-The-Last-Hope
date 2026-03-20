shader_type canvas_item;

uniform float glow_strength : hint_range(0.0, 5.0) = 1.6;
uniform float glow_size = 4.0;
uniform vec4 glow_color : source_color = vec4(1.0, 1.0, 1.0, 1.0);
uniform float time_scale = 2.0;

void fragment() {
    vec4 tex = texture(TEXTURE, UV);
    float alpha = tex.a;

    // Flicker + breathing
    float flicker = fract(sin(TIME * 10.0) * 43758.5453) * 0.05;
    float pulse = 1.2 + sin(TIME * time_scale) * 0.25 + flicker;

    // Stronger, wider glow sampling
    float glow = 0.0;
    float total = 0.0;

    for (int x = -4; x <= 4; x++) {
        for (int y = -4; y <= 4; y++) {
            vec2 offset = vec2(float(x), float(y)) * TEXTURE_PIXEL_SIZE * glow_size;

            float weight = 1.0 - length(vec2(float(x), float(y))) / 5.5;
            weight = max(weight, 0.0);

            glow += texture(TEXTURE, UV + offset).a * weight;
            total += weight;
        }
    }

    glow /= total;

    // Emission-style glow (strong + spreads outward)
    vec3 emission = glow_color.rgb * glow * glow_strength * pulse;

    // Core text + emission
    COLOR.rgb = tex.rgb + emission;
    COLOR.a = max(alpha, glow * 0.6);
}