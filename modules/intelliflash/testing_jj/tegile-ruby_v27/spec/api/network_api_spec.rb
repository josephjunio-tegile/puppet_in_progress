=begin
#Tegile IntelliFlassh WEB API

#WEB API for managing Tegile IntelliFlash Arrays.

OpenAPI spec version: 2.2.0

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.3.0-SNAPSHOT

=end

require 'spec_helper'
require 'json'

# Unit tests for IFClient::NetworkApi
# Automatically generated by swagger-codegen (github.com/swagger-api/swagger-codegen)
# Please update as you see appropriate
describe 'NetworkApi' do
  before do
    # run before each test
    @instance = IFClient::NetworkApi.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of NetworkApi' do
    it 'should create an instance of NetworkApi' do
      expect(@instance).to be_instance_of(IFClient::NetworkApi)
    end
  end

  # unit tests for get_floating_ip_list_post
  # Specify the target pool name.
  # 
  # @param get_floating_ip_list_param 
  # @param [Hash] opts the optional parameters
  # @return [Array<FloatingIP_V2_2>]
  describe 'get_floating_ip_list_post test' do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end