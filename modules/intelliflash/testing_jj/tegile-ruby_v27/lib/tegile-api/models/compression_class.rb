=begin
#Tegile IntelliFlassh WEB API

#WEB API for managing Tegile IntelliFlash Arrays.

OpenAPI spec version: 2.2.0

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.3.0-SNAPSHOT

=end

require 'date'

module IFClient
  class CompressionClass
    # value of the enum 
    attr_accessor :value
    
    OFF = CompressionClass.new.tap do |u|
      u.value = "OFF"
      u.freeze
    end
    
    OPTIMAL_PERFORMANCE = CompressionClass.new.tap do |u|
      u.value = "Optimal Performance"
      u.freeze
    end
    
    HIGH_COMPRESSION = CompressionClass.new.tap do |u|
      u.value = "High Compression"
      u.freeze
    end
    
    
    # Builds the enum from value
    # @param [value] The enum value 
    # @return self 
    def build_from_hash(value)
      constValues = CompressionClass.constants.select{|c| CompressionClass.const_get(c).value == value}
      raise "Invalid ENUM value #{value} for class #CompressionClass" if constValues.length != 1
      @value = CompressionClass.const_get(constValues[0]).value
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