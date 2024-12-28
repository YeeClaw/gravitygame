shader_type spatial;

render_mode depth_test_off, cull_back;

void fragment() {
    // Your usual fragment shader code goes here
    // For example, you can color the arrow or use a texture.
    vec4 color = vec4(1.0, 0.0, 0.0, 1.0);  // Example: red color
    ALBEDO = color.rgb;
    ALPHA = color.a;
}

