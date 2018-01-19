=begin
#Tegile IntelliFlassh WEB API

#WEB API for managing Tegile IntelliFlash Arrays.

OpenAPI spec version: 2.2.0

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.3.0-SNAPSHOT

=end

require 'date'

module IFClient
  class Mode_enum
    # value of the enum 
    attr_accessor :value
    
    N0 = Mode_enum.new.tap do |u|
      u.value = 0
      u.freeze
    end
    
    N1 = Mode_enum.new.tap do |u|
      u.value = 1
      u.freeze
    end
    
    
    # Builds the enum from value
    # @param [value] The enum value 
    # @return self 
    def build_from_hash(value)
      constValues = Mode_enum.constants.select{|c| Mode_enum.const_get(c).value == value}
      raise "Invalid ENUM value #{value} for class #Mode_enum" if constValues.length != 1
      @value = Mode_enum.const_get(constValues[0]).value
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
