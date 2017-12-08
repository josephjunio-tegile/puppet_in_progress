=begin
#Tegile IntelliFlassh WEB API

#WEB API for managing Tegile IntelliFlash Arrays.

OpenAPI spec version: 2.0.0

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.3.0-SNAPSHOT

=end

require 'date'

module IFClient

  class CloneProjectSnapshotParam
    # Path of the project-level snapshot that has to be cloned. The snapshot path has the format: PoolName/Local/ProjectName@SnapshotName.  You can get the snapshotPath from the listSnapshots API. For more information, see listSnapshots. 
    attr_accessor :arg0_snapshot_path

    # A string that is used to create names of the new datasets.  The clone name is appended to the resultant share and volume names. The characters ,, /,\\\\, !, ?, @, <, >, #, $, ',%, ^,*,(, ), ~,+, =, },|, :, {, [, ], ;, \\', \\\", & are not allowed in clonename.  The empty and space characters and the null values are not allowed in clonename. 
    attr_accessor :arg1_clone_name

    # A boolean value that indicates whether the new dataset will inherit project settings. 
    attr_accessor :arg2_inherit_project_settings


    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'arg0_snapshot_path' => :'arg0_SnapshotPath',
        :'arg1_clone_name' => :'arg1_CloneName',
        :'arg2_inherit_project_settings' => :'arg2_InheritProjectSettings'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'arg0_snapshot_path' => :'String',
        :'arg1_clone_name' => :'String',
        :'arg2_inherit_project_settings' => :'BOOLEAN'
      }
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}){|(k,v), h| h[k.to_sym] = v}

      if attributes.has_key?(:'arg0_SnapshotPath')
        self.arg0_snapshot_path = attributes[:'arg0_SnapshotPath']
      end

      if attributes.has_key?(:'arg1_CloneName')
        self.arg1_clone_name = attributes[:'arg1_CloneName']
      end

      if attributes.has_key?(:'arg2_InheritProjectSettings')
        self.arg2_inherit_project_settings = attributes[:'arg2_InheritProjectSettings']
      end

    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properies with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      if @arg0_snapshot_path.nil?
        invalid_properties.push("invalid value for 'arg0_snapshot_path', arg0_snapshot_path cannot be nil.")
      end

      if @arg1_clone_name.nil?
        invalid_properties.push("invalid value for 'arg1_clone_name', arg1_clone_name cannot be nil.")
      end

      if @arg2_inherit_project_settings.nil?
        invalid_properties.push("invalid value for 'arg2_inherit_project_settings', arg2_inherit_project_settings cannot be nil.")
      end

      return invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if @arg0_snapshot_path.nil?
      return false if @arg1_clone_name.nil?
      return false if @arg2_inherit_project_settings.nil?
      return true
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          arg0_snapshot_path == o.arg0_snapshot_path &&
          arg1_clone_name == o.arg1_clone_name &&
          arg2_inherit_project_settings == o.arg2_inherit_project_settings
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [arg0_snapshot_path, arg1_clone_name, arg2_inherit_project_settings].hash
    end

    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def build_from_hash(attributes)
      return nil unless attributes.is_a?(Hash)
      self.class.swagger_types.each_pair do |key, type|
        if type =~ /\AArray<(.*)>/i
          # check to ensure the input is an array given that the the attribute
          # is documented as an array but the input is not
          if attributes[self.class.attribute_map[key]].is_a?(Array)
            self.send("#{key}=", attributes[self.class.attribute_map[key]].map{ |v| _deserialize($1, v) } )
          end
        elsif !attributes[self.class.attribute_map[key]].nil?
          self.send("#{key}=", _deserialize(type, attributes[self.class.attribute_map[key]]))
        end # or else data not found in attributes(hash), not an issue as the data can be optional
      end

      self
    end

    # Deserializes the data based on type
    # @param string type Data type
    # @param string value Value to be deserialized
    # @return [Object] Deserialized data
    def _deserialize(type, value)
      case type.to_sym
      when :DateTime
        DateTime.parse(value)
      when :Date
        Date.parse(value)
      when :String
        value.to_s
      when :Integer
        value.to_i
      when :Float
        value.to_f
      when :BOOLEAN
        if value.to_s =~ /\A(true|t|yes|y|1)\z/i
          true
        else
          false
        end
      when :Object
        # generic object (usually a Hash), return directly
        value
      when /\AArray<(?<inner_type>.+)>\z/
        inner_type = Regexp.last_match[:inner_type]
        value.map { |v| _deserialize(inner_type, v) }
      when /\AHash<(?<k_type>.+?), (?<v_type>.+)>\z/
        k_type = Regexp.last_match[:k_type]
        v_type = Regexp.last_match[:v_type]
        {}.tap do |hash|
          value.each do |k, v|
            hash[_deserialize(k_type, k)] = _deserialize(v_type, v)
          end
        end
      else # model
        temp_model = IFClient.const_get(type).new
        temp_model.build_from_hash(value)
      end
    end

    # Returns the string representation of the object
    # @return [String] String presentation of the object
    def to_s
      to_hash.to_s
    end

    # to_body is an alias to to_hash (backward compatibility)
    # @return [Hash] Returns the object in the form of hash
    def to_body
      to_hash
    end

    # Returns the object in the form of hash
    # @return [Hash] Returns the object in the form of hash
    def to_hash
      hash = {}
      self.class.attribute_map.each_pair do |attr, param|
        value = self.send(attr)
        next if value.nil?
        hash[param] = _to_hash(value)
      end
      hash
    end

    # Outputs non-array value in the form of hash
    # For object, use to_hash. Otherwise, just return the value
    # @param [Object] value Any valid value
    # @return [Hash] Returns the value in the form of hash
    def _to_hash(value)
      if value.is_a?(Array)
        value.compact.map{ |v| _to_hash(v) }
      elsif value.is_a?(Hash)
        {}.tap do |hash|
          value.each { |k, v| hash[k] = _to_hash(v) }
        end
      elsif value.respond_to? :to_hash
        value.to_hash
      else
        value
      end
    end

  end

end
