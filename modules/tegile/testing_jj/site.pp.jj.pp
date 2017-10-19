node 'tegile-3.7' {

  lun { 'TestingResource1':
   ensure                     => present,
   lun_name                   => "lun1",
   project_name               => "project1",
   pool_name                  => "pool-a",
   lun_size                   => 132070244352,
   block_size                 => "32KB",
   lun_protocol               => "iSCSI",
  #  override_project_mappings  => "yes",
  #  lun_mappings               => [["initiator-group3", "iscsi-target-group3", 3, false],["initiator-group4", "iscsi-target-group4", 4, false]],
  }

  share { 'TestingResource2':
   ensure                            => present,
   share_name                        => "share1",
   project_name                      => "project1",
   pool_name                         => "pool-a",
   block_size                        => "32KB",
   override_project_nfs_network_acls => "yes",
   nfs_network_acls                  => [["IP", "3.3.3.3", "rw", false],["IP", "4.4.4.4", "rw", false]],
  }

  project { 'TestingResource2.1':
   ensure                     => present,
   project_name               => "project1",
   pool_name                  => "pool-a",
   compression_type           => "lz4",
   compressed_log             => "lz4",
   intended_protocol_list     => ["iSCSI","NFS","SMB"],
   quota                      => 1288490188800,
   dedup                      => "on",
   ##primary_cache             => "All",
   ##secondary_cache           => "All",
   ##acl_inherit               => "On",
   ##default_lun_size           => 429496729600,
   default_lun_block_size     => "64KB",
   default_share_block_size   => "64KB",
   default_thin_provisioning  => true,
   lun_mappings               => [["initiator-group1", "iscsi-target-group1", -1, false],["initiator-group2", "iscsi-target-group2", -1, false],["puppet-initiator-group1", "puppet-iscsi-target-group1", -1, false]],
   nfs_network_acls           => [["IP", "1.1.1.1", "rw", false],["IP", "2.2.2.2", "rw", false]],
  }

  initiator { 'TestingResource6':
   ensure                    => present,
   initiator_name            => "iqn.2017-07.com.test:puppet-host1",
   initiator_group_name      => "puppet-initiator-group1",
  #  initiator_chap_user_name  => "",
  #  initiator_chap_secret     => "",
  }

  initiator_group { 'TestingResource6.1':
   ensure                => present,
   initiator_group_name  => "puppet-initiator-group1",
  }

  iscsi_target { 'TestingResource3':
   ensure                    => present,
   iscsi_target_name         => "puppet-iscsi-target1",
   iscsi_target_alias        => "puppet-iscsi-target1",
   iscsi_target_group        => "puppet-iscsi-target-group1",
  #  iscsi_target_auth         => "none",
  #  iscsi_target_chap_name    => "",
  #  iscsi_target_chap_secret  => "",
   iscsi_target_ip           => "10.65.3.33",
   iscsi_target_port         => "3260",
  }

  iscsi_target_group { 'TestingResource3.1':
    ensure                  => present,
    iscsi_target_group_name => "puppet-iscsi-target-group1",
    pool_name               => "pool-a",
  }

}




 node default {
}
