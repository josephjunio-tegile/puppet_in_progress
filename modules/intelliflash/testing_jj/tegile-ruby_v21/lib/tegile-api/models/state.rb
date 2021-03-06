=begin
#Tegile IntelliFlassh WEB API

#WEB API for managing Tegile IntelliFlash Arrays.

OpenAPI spec version: 2.0.0

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.3.0-SNAPSHOT

=end

require 'date'

module IFClient
  class State
    # value of the enum 
    attr_accessor :value
    
    N0 = State.new.tap do |u|
      u.value = 0
      u.freeze
    end
    
    N1 = State.new.tap do |u|
      u.value = 1
      u.freeze
    end
    
    N2 = State.new.tap do |u|
      u.value = 2
      u.freeze
    end
    
    N3 = State.new.tap do |u|
      u.value = 3
      u.freeze
    end
    
    N4 = State.new.tap do |u|
      u.value = 4
      u.freeze
    end
    
    N5 = State.new.tap do |u|
      u.value = 5
      u.freeze
    end
    
    N6 = State.new.tap do |u|
      u.value = 6
      u.freeze
    end
    
    N7 = State.new.tap do |u|
      u.value = 7
      u.freeze
    end
    
    N8 = State.new.tap do |u|
      u.value = 8
      u.freeze
    end
    
    N9 = State.new.tap do |u|
      u.value = 9
      u.freeze
    end
    
    
    # Builds the enum from value
    # @param [value] The enum value 
    # @return self 
    def build_from_hash(value)
      constValues = State.constants.select{|c| State.const_get(c).value == value}
      raise "Invalid ENUM value #{value} for class #State" if constValues.length != 1
      @value = State.const_get(constValues[0]).value
      self
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class && value == o.value
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [value].hash
    end
    
    # Returns the object in the form of hash
    # @return [Hash] Returns the object in the form of hash
    def to_hash
      @value
    end

  end

end
