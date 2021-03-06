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

# Unit tests for IFClient::SNAPSHOTPROGRESSSTATUS
# Automatically generated by swagger-codegen (github.com/swagger-api/swagger-codegen)
# Please update as you see appropriate
describe 'SNAPSHOTPROGRESSSTATUS' do
  before do
    # run before each test
    @instance = IFClient::SNAPSHOTPROGRESSSTATUS.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of SNAPSHOTPROGRESSSTATUS' do
    it 'should create an instance of SNAPSHOTPROGRESSSTATUS' do
      expect(@instance).to be_instance_of(IFClient::SNAPSHOTPROGRESSSTATUS)
    end
  end
end

