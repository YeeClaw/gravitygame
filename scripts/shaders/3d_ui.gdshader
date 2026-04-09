shader_type spatial;

render_mode depth_test_disabled, depth_draw_never, unshaded, cull_back;

void fragment() {
    ALBEDO = vec3(1.0, 0.0, 0.0);
}

