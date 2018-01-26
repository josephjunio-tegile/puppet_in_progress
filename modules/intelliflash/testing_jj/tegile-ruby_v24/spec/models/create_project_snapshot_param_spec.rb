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

# Unit tests for IFClient::CreateProjectSnapshotParam
# Automatically generated by swagger-codegen (github.com/swagger-api/swagger-codegen)
# Please update as you see appropriate
describe 'CreateProjectSnapshotParam' do
  before do
    # run before each test
    @instance = IFClient::CreateProjectSnapshotParam.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of CreateProjectSnapshotParam' do
    it 'should create an instance of CreateProjectSnapshotParam' do
      expect(@instance).to be_instance_of(IFClient::CreateProjectSnapshotParam)
    end
  end
  describe 'test attribute "arg0_project"' do
    it 'should work' do
       # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  describe 'test attribute "arg1_snapshot_name"' do
    it 'should work' do
       # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  describe 'test attribute "arg2_quiesce"' do
    it 'should work' do
       # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end

