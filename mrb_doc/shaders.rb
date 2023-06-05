# Loads a shader from a file
# @param vertex_shader_path [String]
# @param fragement_shader_path [String]
# @return [Shader]
def load_shader(vertex_shader_path, fragment_shader_path)
  # mrb_load_shader
  # src/mruby_integration/shaders.cpp
  Shader.new
end

# Unloads a shader
# @param shader [Shader]
# @return [nil]
def unload_shader(shader)
  # mrb_unload_shader
  # src/mruby_integration/shaders.cpp
  nil
end

# Checks if the shader is ready
# @param shader [Shader]
# @return [Boolean]
def shader_ready?(shader)
  # mrb_shader_ready
  # src/mruby_integration/shaders.cpp
  True
end
