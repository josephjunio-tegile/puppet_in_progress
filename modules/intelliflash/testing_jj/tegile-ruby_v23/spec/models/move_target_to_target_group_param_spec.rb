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

# Unit tests for IFClient::MoveTargetToTargetGroupParam
# Automatically generated by swagger-codegen (github.com/swagger-api/swagger-codegen)
# Please update as you see appropriate
describe 'MoveTargetToTargetGroupParam' do
  before do
    # run before each test
    @instance = IFClient::MoveTargetToTargetGroupParam.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of MoveTargetToTargetGroupParam' do
    it 'should create an instance of MoveTargetToTargetGroupParam' do
      expect(@instance).to be_instance_of(IFClient::MoveTargetToTargetGroupParam)
    end
  end
  describe 'test attribute "arg0_target_name"' do
    it 'should work' do
       # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  describe 'test attribute "arg1_new_target_group_name"' do
    it 'should work' do
       # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end

