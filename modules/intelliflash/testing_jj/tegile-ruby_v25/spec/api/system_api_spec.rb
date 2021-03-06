=begin
#Tegile IntelliFlassh WEB API

#WEB API for managing Tegile IntelliFlash Arrays.

OpenAPI spec version: 2.2.0

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.3.0-SNAPSHOT

=end

require 'spec_helper'
require 'json'

# Unit tests for IFClient::SystemApi
# Automatically generated by swagger-codegen (github.com/swagger-api/swagger-codegen)
# Please update as you see appropriate
describe 'SystemApi' do
  before do
    # run before each test
    @instance = IFClient::SystemApi.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of SystemApi' do
    it 'should create an instance of SystemApi' do
      expect(@instance).to be_instance_of(IFClient::SystemApi)
    end
  end

  # unit tests for list_system_properties_post
  # Lists values of the requested system properties for a Tegile array.
  # 
  # @param list_system_properties_param 
  # @param [Hash] opts the optional parameters
  # @return [Array<String>]
  describe 'list_system_properties_post test' do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end
