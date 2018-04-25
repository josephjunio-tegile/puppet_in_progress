=begin
#Tegile IntelliFlassh WEB API

#WEB API for managing Tegile IntelliFlash Arrays.

OpenAPI spec version: 2.2.0

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.3.0-SNAPSHOT

=end

require 'spec_helper'
require 'json'
require 'date'

# Unit tests for IFClient::DeleteInitiatorGroupParam
# Automatically generated by swagger-codegen (github.com/swagger-api/swagger-codegen)
# Please update as you see appropriate
describe 'DeleteInitiatorGroupParam' do
  before do
    # run before each test
    @instance = IFClient::DeleteInitiatorGroupParam.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of DeleteInitiatorGroupParam' do
    it 'should create an instance of DeleteInitiatorGroupParam' do
      expect(@instance).to be_instance_of(IFClient::DeleteInitiatorGroupParam)
    end
  end
  describe 'test attribute "arg0_initiator_group_name"' do
    it 'should work' do
       # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end

