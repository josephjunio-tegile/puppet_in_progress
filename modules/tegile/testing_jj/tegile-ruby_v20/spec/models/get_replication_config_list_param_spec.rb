=begin
#Tegile IntelliFlassh WEB API

#WEB API for managing Tegile IntelliFlash Arrays.

OpenAPI spec version: 2.0.0

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.3.0-SNAPSHOT

=end

require 'spec_helper'
require 'json'
require 'date'

# Unit tests for IFClient::GetReplicationConfigListParam
# Automatically generated by swagger-codegen (github.com/swagger-api/swagger-codegen)
# Please update as you see appropriate
describe 'GetReplicationConfigListParam' do
  before do
    # run before each test
    @instance = IFClient::GetReplicationConfigListParam.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of GetReplicationConfigListParam' do
    it 'should create an instance of GetReplicationConfigListParam' do
      expect(@instance).to be_instance_of(IFClient::GetReplicationConfigListParam)
    end
  end
  describe 'test attribute "arg0_pool_name"' do
    it 'should work' do
       # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  describe 'test attribute "arg1_project_name"' do
    it 'should work' do
       # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end

