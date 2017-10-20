=begin
#Tegile IntelliFlassh WEB API

#WEB API for managing Tegile IntelliFlash Arrays.

OpenAPI spec version: 2.0.0

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.3.0-SNAPSHOT

=end

require 'spec_helper'
require 'json'

# Unit tests for IFClient::SANApi
# Automatically generated by swagger-codegen (github.com/swagger-api/swagger-codegen)
# Please update as you see appropriate
describe 'SANApi' do
  before do
    # run before each test
    @instance = IFClient::SANApi.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of SANApi' do
    it 'should create an instance of SANApi' do
      expect(@instance).to be_instance_of(IFClient::SANApi)
    end
  end

  # unit tests for add_initiator_to_initiator_group_post
  # Associates an initiator with an initiator group.
  # Associates an initiator with an initiator group. If the initiator group is not present then this method attempts to create it.  If the initiator does not exist, then the method fails. 
  # @param add_initiator_to_initiator_group_param 
  # @param [Hash] opts the optional parameters
  # @return [COMMANDSTATUS]
  describe 'add_initiator_to_initiator_group_post test' do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for create_fc_initiator_post
  # Create an FC Initiator
  # 
  # @param create_fc_initiator_param 
  # @param [Hash] opts the optional parameters
  # @return [COMMANDSTATUS]
  describe 'create_fc_initiator_post test' do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for create_initiator_group_post
  # Creates an initiator group on a Tegile array.
  # 
  # @param create_initiator_group_param 
  # @param [Hash] opts the optional parameters
  # @return [COMMANDSTATUS]
  describe 'create_initiator_group_post test' do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for create_iscsi_initiator_post
  # Creates an iSCSI initiator object on the Tegile array. If the initiator name already exists, then the method fails.
  # 
  # @param create_iscsi_initiator_param IscsiInitiator_V1_0 that contains the name of the initiator and optional CHAP information
  # @param [Hash] opts the optional parameters
  # @return [COMMANDSTATUS]
  describe 'create_iscsi_initiator_post test' do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for create_iscsi_target_for_group_post
  # Create an iSCSI Target and add into specified Target Group
  # This is a simpler version of createIscsiTarget() api that has all the parameters for target creation. This api will default to the iSCSI network bindings associated with a target group. It will default to none (or no) chap authentication. It will allow the user to create a new iSCSI target with the user specified target suffix, alias and group name. 
  # @param create_iscsi_target_for_group_param 
  # @param [Hash] opts the optional parameters
  # @return [COMMANDSTATUS]
  describe 'create_iscsi_target_for_group_post test' do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for create_iscsi_target_post
  # Create an iSCSI Target
  # 
  # @param create_iscsi_target_param 
  # @param [Hash] opts the optional parameters
  # @return [COMMANDSTATUS]
  describe 'create_iscsi_target_post test' do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for create_mapping_for_project_post
  # Create a project level default mapping
  # 
  # @param create_mapping_for_project_param 
  # @param [Hash] opts the optional parameters
  # @return [COMMANDSTATUS]
  describe 'create_mapping_for_project_post test' do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for create_mapping_for_volume_post
  # Maps a volume to an initiator group and a target group.
  # 
  # @param create_mapping_for_volume_param 
  # @param [Hash] opts the optional parameters
  # @return [COMMANDSTATUS]
  describe 'create_mapping_for_volume_post test' do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for create_target_group_post
  # Create a target group with the specified target group name in the resource group containing the named pool with the intended protocol  
  # 
  # @param create_target_group_param 
  # @param [Hash] opts the optional parameters
  # @return [COMMANDSTATUS]
  describe 'create_target_group_post test' do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for delete_initiator_group_post
  # Delete an Initiator Group
  # 
  # @param delete_initiator_group_param 
  # @param [Hash] opts the optional parameters
  # @return [COMMANDSTATUS]
  describe 'delete_initiator_group_post test' do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for delete_iscsi_initiator_post
  # Delete an iSCSI Initiator
  # 
  # @param delete_iscsi_initiator_param 
  # @param [Hash] opts the optional parameters
  # @return [COMMANDSTATUS]
  describe 'delete_iscsi_initiator_post test' do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for delete_iscsi_target_post
  # Delete an iSCSI Target
  # 
  # @param delete_iscsi_target_param 
  # @param [Hash] opts the optional parameters
  # @return [COMMANDSTATUS]
  describe 'delete_iscsi_target_post test' do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for delete_mapping_from_project_post
  # Deletes the view (mapping) between the given project, initiator group, and target group.
  # 
  # @param delete_mapping_from_project_param 
  # @param [Hash] opts the optional parameters
  # @return [COMMANDSTATUS]
  describe 'delete_mapping_from_project_post test' do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for delete_mapping_from_volume_post
  # Deletes the view (mapping) between the given volume, initiator group, and target group.
  # 
  # @param delete_mapping_from_volume_param 
  # @param [Hash] opts the optional parameters
  # @return [COMMANDSTATUS]
  describe 'delete_mapping_from_volume_post test' do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for delete_target_group_post
  # Delete a Target Group
  # 
  # @param delete_target_group_param 
  # @param [Hash] opts the optional parameters
  # @return [COMMANDSTATUS]
  describe 'delete_target_group_post test' do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for get_initiator_group_post
  # Gets the name of the initiator group to which the initiator belongs.
  # 
  # @param get_initiator_group_param 
  # @param [Hash] opts the optional parameters
  # @return [Array<String>]
  describe 'get_initiator_group_post test' do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for get_project_default_fc_it_view_post
  # List all of the default FC views of the project
  # 
  # @param get_project_default_fc_it_view_param 
  # @param [Hash] opts the optional parameters
  # @return [Array<ITViewV21>]
  describe 'get_project_default_fc_it_view_post test' do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for get_project_default_iscsi_it_view_post
  # List all of the default iSCSI views of the project
  # 
  # @param get_project_default_iscsi_it_view_param 
  # @param [Hash] opts the optional parameters
  # @return [Array<ITViewV21>]
  describe 'get_project_default_iscsi_it_view_post test' do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for get_volume_it_view_post
  # List all of the existing views of the volume
  # 
  # @param get_volume_it_view_param 
  # @param [Hash] opts the optional parameters
  # @return [Array<ITViewV21>]
  describe 'get_volume_it_view_post test' do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for initiator_group_exists_post
  # Checks if an initiator group exists on the Tegile array.
  # 
  # @param initiator_group_exists_param 
  # @param [Hash] opts the optional parameters
  # @return [BOOLEAN]
  describe 'initiator_group_exists_post test' do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for list_fc_initiator_groups_get
  # Lists the names of all Fibre Channel initiator groups created on a Tegile array.
  # 
  # @param [Hash] opts the optional parameters
  # @return [Array<String>]
  describe 'list_fc_initiator_groups_get test' do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for list_fc_initiators_post
  # List Fibre Channel Initiators with name matching specified pattern
  # 
  # @param list_fc_initiators_param 
  # @param [Hash] opts the optional parameters
  # @return [Array<FCInitiatorV21>]
  describe 'list_fc_initiators_post test' do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for list_fc_target_groups_get
  # Lists all Fibre Channel Target groups available on a Tegile array.
  # 
  # @param [Hash] opts the optional parameters
  # @return [Array<String>]
  describe 'list_fc_target_groups_get test' do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for list_fc_targets_post
  # List Fibre Channel Targets with name matching specified pattern
  # 
  # @param list_fc_targets_param 
  # @param [Hash] opts the optional parameters
  # @return [Array<FCTargetV21>]
  describe 'list_fc_targets_post test' do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for list_initiator_groups_get
  # List all initiator groups available on IntelliFlash Array
  # 
  # @param [Hash] opts the optional parameters
  # @return [Array<InitiatorGroupV21>]
  describe 'list_initiator_groups_get test' do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for list_initiators_in_initiator_group_post
  # Lists all initiators belonging to the specified initiator group.
  # 
  # @param list_initiators_in_initiator_group_param 
  # @param [Hash] opts the optional parameters
  # @return [Array<String>]
  describe 'list_initiators_in_initiator_group_post test' do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for list_iscsi_initiator_groups_get
  # Lists all the iSCSI initiator groups available on a Tegile array.
  # 
  # @param [Hash] opts the optional parameters
  # @return [Array<String>]
  describe 'list_iscsi_initiator_groups_get test' do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for list_iscsi_initiators_post
  # List iSCSI Initiators with name matching specified pattern
  # 
  # @param list_iscsi_initiators_param 
  # @param [Hash] opts the optional parameters
  # @return [Array<ISCSIInitiatorV21>]
  describe 'list_iscsi_initiators_post test' do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for list_iscsi_target_groups_get
  # Lists all the iSCSI target groups available on a Tegile array.
  # 
  # @param [Hash] opts the optional parameters
  # @return [Array<String>]
  describe 'list_iscsi_target_groups_get test' do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for list_iscsi_targets_post
  # List iSCSI Targets with name matching specified pattern
  # 
  # @param list_iscsi_targets_param 
  # @param [Hash] opts the optional parameters
  # @return [Array<ISCSITargetV21>]
  describe 'list_iscsi_targets_post test' do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for list_targets_in_target_group_post
  # Lists all targets associated with the target group.
  # 
  # @param list_targets_in_target_group_param 
  # @param [Hash] opts the optional parameters
  # @return [Array<String>]
  describe 'list_targets_in_target_group_post test' do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for modify_iscsi_target_alias_post
  # Modify Alias of an iSCSI Target
  # 
  # @param param 
  # @param [Hash] opts the optional parameters
  # @return [COMMANDSTATUS]
  describe 'modify_iscsi_target_alias_post test' do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for move_target_to_target_group_post
  # Move a target specified with targetName to a new target group specified with newTargetGroupName
  # 
  # @param move_target_to_target_group_param 
  # @param [Hash] opts the optional parameters
  # @return [COMMANDSTATUS]
  describe 'move_target_to_target_group_post test' do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end
