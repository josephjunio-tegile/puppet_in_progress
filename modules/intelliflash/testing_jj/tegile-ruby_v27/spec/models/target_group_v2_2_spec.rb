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

# Unit tests for IFClient::TargetGroup_V2_2
# Automatically generated by swagger-codegen (github.com/swagger-api/swagger-codegen)
# Please update as you see appropriate
describe 'TargetGroup_V2_2' do
  before do
    # run before each test
    @instance = IFClient::TargetGroup_V2_2.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of TargetGroup_V2_2' do
    it 'should create an instance of TargetGroup_V2_2' do
      expect(@instance).to be_instance_of(IFClient::TargetGroup_V2_2)
    end
  end
  describe 'test attribute "target_group_name"' do
    it 'should work' do
       # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  describe 'test attribute "intended_protocol"' do
    it 'should work' do
       # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end

