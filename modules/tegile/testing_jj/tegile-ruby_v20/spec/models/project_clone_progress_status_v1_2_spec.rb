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

# Unit tests for IFClient::ProjectCloneProgressStatusV12
# Automatically generated by swagger-codegen (github.com/swagger-api/swagger-codegen)
# Please update as you see appropriate
describe 'ProjectCloneProgressStatusV12' do
  before do
    # run before each test
    @instance = IFClient::ProjectCloneProgressStatusV12.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of ProjectCloneProgressStatusV12' do
    it 'should create an instance of ProjectCloneProgressStatusV12' do
      expect(@instance).to be_instance_of(IFClient::ProjectCloneProgressStatusV12)
    end
  end
  describe 'test attribute "failed_sub_projects"' do
    it 'should work' do
       # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  describe 'test attribute "project_clone_state"' do
    it 'should work' do
       # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  describe 'test attribute "total_sub_projects"' do
    it 'should work' do
       # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end

