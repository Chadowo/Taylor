# The Shader class is for doing operations on the GPU
class Shader
  # @return [Integer]
  attr_reader :id

  # Loads a Shader
  # @param vertex_shader_path [String]
  # @param fragment_shader_path [String]
  # @return [Shader]
  def self.load(vertex_shader_path, fragment_shader_path)
    load_shader(vertex_shader_path, fragment_shader_path)
  end

  # Unloads the Shader from memory
  # @return [nil]
  def unload
    unload_shader(self)
  end

  # Instead of rendering straight to the screen, render through this Shader first
  # @yield The block that calls your rendering logic
  # @return [nil]
  def draw(&block)
    begin_shader_mode(self)
    block.call
    end_shader_mode
  end

  # Is the Shader ready to be used?
  # @return [Boolean]
  def ready?
    shader_ready?(self)
  end

  # Returns the location of uniform variable, will return nil if not found.
  # @param variable [String]
  # @return [Integer]
  def get_uniform_location(variable)
    value = get_shader_location(self, variable)
    value == -1 ? nil : value
  end

  # Sets the variable to the specified value, will auto detect the
  # `variable_type` if no `variable_type` is passed in. You must pass in either
  # `variable` or `variable_location`.
  # @param value [Integer,Float] Either a single value or an array of 4 or less
  # @param variable [String]
  # @param variable_location [Integer]
  # @param variable_type [Integer] Must be one of {Shader::Uniform::FLOAT},
  #   {Shader::Uniform::VEC2}, {Shader::Uniform::VEC3}, {Shader::Uniform::VEC4},
  #   {Shader::Uniform::INT}, {Shader::Uniform::IVEC2}, {Shader::Uniform::IVEC3},
  #   {Shader::Uniform::IVEC4}. If left blank Taylor will make a best guess what
  #   you wanted to hand in.
  # @return [nil]
  def set_value(value:, variable: nil, variable_location: nil, variable_type: nil)
    if variable.nil? && variable_location.nil?
      raise ArgumentError, "You must specify at least one of variable or variable_location"
    end

    if variable_location && variable_type
      return set_values(values: [value], variable_location: variable_location, variable_type: variable_type)
    end

    if variable && variable_location.nil?
      variable_location = get_uniform_location(variable)
    end

    if variable_type.nil?
      variable_type = detect_uniform_type(values: [value])
    end

    set_values(
      values: [value],
      variable_location: variable_location,
      variable_type: variable_type,
    )
  end

  # Sets the variables to the specified values, will auto detect the
  # `variable_type` if no `variable_type` is passed in. You must pass in either
  # `variable` or `variable_location`.
  # @param values [Array[Integer,Float]] An Array of either single values or arrays of 4 or less
  # @param variable [String]
  # @param variable_location [Integer]
  # @param variable_type [Integer] Must be one of {Shader::Uniform::FLOAT},
  #   {Shader::Uniform::VEC2}, {Shader::Uniform::VEC3}, {Shader::Uniform::VEC4},
  #   {Shader::Uniform::INT}, {Shader::Uniform::IVEC2}, {Shader::Uniform::IVEC3},
  #   {Shader::Uniform::IVEC4}. If left blank Taylor will make a best guess what
  #   you wanted to hand in.
  # @return [Nil]
  def set_values(values:, variable: nil, variable_location: nil, variable_type: nil)
    unless values.is_a?(Array)
      raise ArgumentError, "You must pass an array of values"
    end
    if variable.nil? && variable_location.nil?
      raise ArgumentError, "You must specify at least one of variable or variable_location"
    end

    if variable && variable_location.nil?
      variable_location = get_uniform_location(variable)
    end

    if variable_type.nil?
      variable_type = detect_uniform_type(values: values)
    end

    set_shader_values(
      self,
      variable_location,
      values,
      variable_type,
    )
  end

  private

  # Takes a set of values that would be passed to {Shader#set_values} or
  # {Shader#set_value} and tries it's best to determine which enum value is
  # most fitting.
  # @param values [Array[Integer,Float]] An Array of either single values or arrays of 4 or less
  # @return [Shader::Uniform::FLOAT, Shader::Uniform::VEC2, Shader::Uniform::VEC3, Shader::Uniform::VEC4, Shader::Uniform::INT, Shader::Uniform::IVEC2, Shader::Uniform::IVEC3, Shader::Uniform::IVEC4]
  # @raise [ArgumentError] When it can't detect what value it should be, we consider that bad enough to raise
  def detect_uniform_type(values:)
    case values.first
    when Numeric
    when Array
      case values.first.first
      when Numeric
      else
        raise ArgumentError, "You can only set numeric values for a uniform variable"
      end
    else
      raise ArgumentError, "You can only set numeric values for a uniform variable"
    end

    case values.first
    when Float
        Shader::Uniform::FLOAT

    when Integer
      Shader::Uniform::INT
    when Array
      case values.first.first
      when Float
        case values.first.length
        when 2
          Shader::Uniform::VEC2
        when 3
          Shader::Uniform::VEC3
        when 4
          Shader::Uniform::VEC4
        else
          raise ArgumentError, "Invalid length, expected between 1 and 4 floats"
        end
      when Integer
        case values.first.length
        when 2
          Shader::Uniform::IVEC2
        when 3
          Shader::Uniform::IVEC3
        when 4
          Shader::Uniform::IVEC4
        else
          raise ArgumentError, "Invalid length, expected between 1 and 4 integers"
        end
      end
    else
      raise ArgumentError, "You can only set numeric values for a uniform variable"
    end
  end

  # An encapsulating module for enums
  module Uniform
    # A single float value
    FLOAT = 0
    # An array of 2 floats
    VEC2 = 1
    # An array of 3 floats
    VEC3 = 2
    # An array of 4 floats
    VEC4 = 3
    # An single integer value
    INT = 4
    # An array of 2 integers
    IVEC2 = 5
    # An array of 3 integers
    IVEC3 = 6
    # An array of 4 integers
    IVEC4 = 7
    #SAMPLER2D = 8
  end
end
