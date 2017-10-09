node 'tegile-3.7' {

  # lun { 'TestingResource1':
  #  ensure                     => present,
  #  lun_name                   => "lun1",
  #  project_name               => "project1",
  #  pool_name                  => "pool-a",
  #  lun_size                   => 132070244352,
  #  block_size                 => "32KB",
  #  lun_protocol               => "iSCSI",
  #  override_project_mappings  => "yes",
  #  lun_mappings               => [["initiator-group4", "iscsi-target-group3", -1, false],["initiator-group2", "iscsi-target-group1", -1, false]],
  # }

  share { 'TestingResource2':
   ensure                            => present,
   share_name                        => "share1",
   project_name                      => "project1",
   pool_name                         => "pool-a",
   block_size                        => "32KB",
  #  override_project_nfs_network_acls => "yes",
  #  nfs_network_acls                  => [["IP", "30.3.3.3", "rw", false],["IP", "10.1.1.1", "rw", false],["IP", "20.2.2.2", "rw", false]],
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
   default_thin_provisioning  => true,  ##does this have the issue with insync? I saw with override_project_nfs_network_acls????
   lun_mapping                => [["initiator-group4", "iscsi-target-group2", -1, false],["initiator-group2", "iscsi-target-group2", -1, false]],
   nfs_network_acls           => [["IP", "3.3.3.3", "rw", false],["IP", "1.1.1.1", "rw", false],["IP", "2.2.2.2", "rw", false]],
  }

  #iscsi_target { 'TestingResource3':
  #  ensure                    => present,
  #  iscsi_target_name         => "iscsi-target1",
  #  iscsi_target_alias        => "iscsi-target1",
  #  iscsi_target_group        => "iscsi-target-group1",
  #  iscsi_target_auth         => "none",
  #  iscsi_target_chap_name    => "",
  #  iscsi_target_chap_secret  => "",
  #  iscsi_target_ip           => "10.65.3.33",
  #  iscsi_target_port         => "3260",
  #}

  iscsi_target_group { 'TestingResource3.1':
    ensure                  => present,
    iscsi_target_group_name => "puppet-target-group2",
    pool_name               => "pool-a",
  }

  #initiator { 'TestingResource6':
  #  ensure                    => present,
  #  initiator_name            => "iqn.2017-07.com.test:host1",
  #  initiator_group_name      => "initiator-group1",
  #  initiator_chap_user_name  => "",
  #  initiator_chap_secret     => "",
  #}

  #initiator_group { 'TestingResource6.1':
  #  ensure                => present,
  #  initiator_group_name  => "initiator-group1",
  #}

}


 node default {
}
