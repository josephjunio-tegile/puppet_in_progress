=begin
#Tegile IntelliFlassh WEB API

#WEB API for managing Tegile IntelliFlash Arrays.

OpenAPI spec version: 2.0.0

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.3.0-SNAPSHOT

=end

require 'spec_helper'
require 'json'

# Unit tests for IFClient::SnapshotApi
# Automatically generated by swagger-codegen (github.com/swagger-api/swagger-codegen)
# Please update as you see appropriate
describe 'SnapshotApi' do
  before do
    # run before each test
    @instance = IFClient::SnapshotApi.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of SnapshotApi' do
    it 'should create an instance of SnapshotApi' do
      expect(@instance).to be_instance_of(IFClient::SnapshotApi)
    end
  end

  # unit tests for clone_project_snapshot_post
  # Clones the specified project-level snapshot. This creates new datasets at the share and volume levels for all shares and volumes that have a snapshot with the specified name.
  # 
  # @param clone_project_snapshot_param 
  # @param [Hash] opts the optional parameters
  # @return [nil]
  describe 'clone_project_snapshot_post test' do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for clone_share_snapshot_post
  # Clones the specified share-level snapshot.
  # 
  # @param clone_share_snapshot_param 
  # @param [Hash] opts the optional parameters
  # @return [nil]
  describe 'clone_share_snapshot_post test' do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for clone_volume_snapshot_post
  # Clones the specified snapshot of a volume.
  # 
  # @param clone_volume_snapshot_param 
  # @param [Hash] opts the optional parameters
  # @return [nil]
  describe 'clone_volume_snapshot_post test' do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for create_project_snapshot_post
  # Recursively creates snapshots of the specified project and the datasets within the project. The string \&quot;Manual-P-\&quot; is prefixed to the names of the snapshots created.
  # 
  # @param create_project_snapshot_param 
  # @param [Hash] opts the optional parameters
  # @return [nil]
  describe 'create_project_snapshot_post test' do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for create_share_snapshot_post
  # Recursively creates snapshot of the specified share. The string \&quot;Manual-S-\&quot; is prefixed to names of the snapshots created.
  # 
  # @param create_share_snapshot_param 
  # @param [Hash] opts the optional parameters
  # @return [nil]
  describe 'create_share_snapshot_post test' do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for create_volume_snapshot_post
  # Recursively creates snapshot of the specified volume. The string \&quot;Manual-V-\&quot; is prefixed to the names of the snapshots created.
  # 
  # @param create_volume_snapshot_param 
  # @param [Hash] opts the optional parameters
  # @return [nil]
  describe 'create_volume_snapshot_post test' do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for delete_project_snapshot_post
  # Deletes the specified project snapshot.
  # 
  # @param delete_project_snapshot_param 
  # @param [Hash] opts the optional parameters
  # @return [SnapShotDeletionStatus]
  describe 'delete_project_snapshot_post test' do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for delete_share_snapshot_post
  # Deletes the specified share snapshot.
  # 
  # @param delete_share_snapshot_param 
  # @param [Hash] opts the optional parameters
  # @return [SnapShotDeletionStatus]
  describe 'delete_share_snapshot_post test' do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for delete_volume_snapshot_post
  # Deletes the specified volume snapshot.
  # 
  # @param delete_volume_snapshot_param 
  # @param [Hash] opts the optional parameters
  # @return [SnapShotDeletionStatus]
  describe 'delete_volume_snapshot_post test' do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for get_project_clone_status_post
  # Gets the status of a clone request on the specified project snapshot.
  # 
  # @param param 
  # @param [Hash] opts the optional parameters
  # @return [ProjectCloneProgressStatusV12]
  describe 'get_project_clone_status_post test' do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for get_project_snapshot_creation_status_post
  # Gets the status of a project snapshot creation request.
  # 
  # @param get_project_snapshot_creation_status_param 
  # @param [Hash] opts the optional parameters
  # @return [SnapshotProgressStatus]
  describe 'get_project_snapshot_creation_status_post test' do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for get_share_snapshot_creation_status_post
  # Gets the status of a share snapshot creation request.
  # 
  # @param get_share_snapshot_creation_status_param 
  # @param [Hash] opts the optional parameters
  # @return [SnapshotProgressStatus]
  describe 'get_share_snapshot_creation_status_post test' do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for get_volume_snapshot_creation_status_post
  # Gets the status of a volume snapshot creation request.
  # 
  # @param get_volume_snapshot_creation_status_param 
  # @param [Hash] opts the optional parameters
  # @return [SnapshotProgressStatus]
  describe 'get_volume_snapshot_creation_status_post test' do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for list_snapshots_post
  # Lists names of snapshots (from the specified dataset) that match with the given regex pattern.
  # 
  # @param list_snapshots_param 
  # @param [Hash] opts the optional parameters
  # @return [Array<String>]
  describe 'list_snapshots_post test' do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for roll_back_to_project_snapshot_post
  # Reverts the project state to the point-in-time state when the snapshot was taken.
  # 
  # @param roll_back_to_project_snapshot_param 
  # @param [Hash] opts the optional parameters
  # @return [COMMANDSTATUS]
  describe 'roll_back_to_project_snapshot_post test' do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for roll_back_to_share_snapshot_post
  # Reverts the share state to the point-in-time state when the snapshot was taken.
  # 
  # @param param 
  # @param [Hash] opts the optional parameters
  # @return [COMMANDSTATUS]
  describe 'roll_back_to_share_snapshot_post test' do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for roll_back_to_volume_snapshot_post
  # Reverts the volume state to the point-in-time state when the snapshot was taken.
  # 
  # @param roll_back_to_volume_snapshot_param 
  # @param [Hash] opts the optional parameters
  # @return [COMMANDSTATUS]
  describe 'roll_back_to_volume_snapshot_post test' do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end
