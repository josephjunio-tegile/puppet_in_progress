=begin
#Tegile IntelliFlassh WEB API

#WEB API for managing Tegile IntelliFlash Arrays.

OpenAPI spec version: 2.0.0

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.3.0-SNAPSHOT

=end

require 'spec_helper'
require 'json'

# Unit tests for IFClient::DataApi
# Automatically generated by swagger-codegen (github.com/swagger-api/swagger-codegen)
# Please update as you see appropriate
describe 'DataApi' do
  before do
    # run before each test
    @instance = IFClient::DataApi.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of DataApi' do
    it 'should create an instance of DataApi' do
      expect(@instance).to be_instance_of(IFClient::DataApi)
    end
  end

  # unit tests for create_project_post
  # Creates a project
  # 
  # @param create_project_param 
  # @param [Hash] opts the optional parameters
  # @return [COMMANDSTATUS]
  describe 'create_project_post test' do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for create_share_post
  # Creates a share with the specified share options and share permissions.
  # 
  # @param create_share_param 
  # @param [Hash] opts the optional parameters
  # @return [COMMANDSTATUS]
  describe 'create_share_post test' do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for create_volume_post
  # Creates a volume with the specified settings.
  # 
  # @param create_volume_param 
  # @param [Hash] opts the optional parameters
  # @return [COMMANDSTATUS]
  describe 'create_volume_post test' do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for delete_dataset_post
  # Deletes the specified dataset.
  # 
  # @param delete_dataset_param 
  # @param [Hash] opts the optional parameters
  # @return [nil]
  describe 'delete_dataset_post test' do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for delete_share_post
  # Deletes the specified share, and optionally, any dependents of the share.
  # 
  # @param delete_share_param 
  # @param [Hash] opts the optional parameters
  # @return [nil]
  describe 'delete_share_post test' do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for delete_volume_post
  # Deletes the specified volume, and optionally, any dependents of the volume.
  # 
  # @param delete_volume_param 
  # @param [Hash] opts the optional parameters
  # @return [nil]
  describe 'delete_volume_post test' do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for get_project_post
  # Get the Project details.
  # 
  # @param get_project_param 
  # @param [Hash] opts the optional parameters
  # @return [ProjectV21]
  describe 'get_project_post test' do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for get_share_post
  # Get the Share details.
  # 
  # @param get_share_param 
  # @param [Hash] opts the optional parameters
  # @return [ShareV21]
  describe 'get_share_post test' do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for get_volume_post
  # Get the Volume details.
  # 
  # @param get_volume_param 
  # @param [Hash] opts the optional parameters
  # @return [VolumeV21]
  describe 'get_volume_post test' do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for inherit_property_from_project_post
  # Inherit properties from parent project settings (revert/rollback to parent setting)
  # 
  # @param inherit_property_from_project_param 
  # @param [Hash] opts the optional parameters
  # @return [COMMANDSTATUS]
  describe 'inherit_property_from_project_post test' do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for list_luns_by_id_post
  # Lists LUN details for the specified LUN IDs.
  # 
  # @param list_luns_by_id_param 
  # @param [Hash] opts the optional parameters
  # @return [Array<LunStatus>]
  describe 'list_luns_by_id_post test' do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for list_pools_get
  # Lists all the pools on the Tegile array
  # 
  # @param [Hash] opts the optional parameters
  # @return [Array<PoolV10>]
  describe 'list_pools_get test' do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for list_projects_post
  # Lists all the local or replicated projects in a pool.
  # 
  # @param list_projects_param 
  # @param [Hash] opts the optional parameters
  # @return [Array<ProjectV10>]
  describe 'list_projects_post test' do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for list_shares_post
  # Lists all the local and replicated shares in a project.
  # 
  # @param list_shares_param 
  # @param [Hash] opts the optional parameters
  # @return [Array<ShareV10>]
  describe 'list_shares_post test' do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for list_volumes_post
  # Lists all the local or replicated volumes within a Project.
  # 
  # @param list_volumes_param 
  # @param [Hash] opts the optional parameters
  # @return [Array<VolumeV10>]
  describe 'list_volumes_post test' do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for modify_project_properties_post
  # Modify value of a subset of Project properties
  # 
  # @param modify_project_properties_param 
  # @param [Hash] opts the optional parameters
  # @return [COMMANDSTATUS]
  describe 'modify_project_properties_post test' do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for modify_share_properties_post
  # Modify value of a subset of project properties
  # 
  # @param modify_share_properties_param 
  # @param [Hash] opts the optional parameters
  # @return [COMMANDSTATUS]
  describe 'modify_share_properties_post test' do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for modify_volume_properties_post
  # Modify value of a subset of Volume properties
  # 
  # @param modify_volume_properties_param 
  # @param [Hash] opts the optional parameters
  # @return [COMMANDSTATUS]
  describe 'modify_volume_properties_post test' do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end
