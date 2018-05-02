node 'tegile-3.7.1.x_2' {

  # initiator_group { 'TestingResource5':
  #  ensure               => present,
  #  initiator_group_name => "puppet-initiator-group1",
  #  members              => ["iqn.2017-07.com.test:puppet-host1"],
  # }

  # initiator { 'TestingResource4':
  #  ensure                    => present,
  #  initiator_name            => "iqn.2017-07.com.test:puppet-host2",
  # #  initiator_chap_user_name  => "",
  # #  initiator_chap_secret     => "",
  # }

  # iscsi_target_group { 'TestingResource7':
  #   ensure                  => present,
  #   iscsi_target_group_name => "puppet-iscsi-target-group1",
  #   pool_name               => "pool-a",
  #   members                 => ["puppet-iscsi-target1"],
  # }
  
  # iscsi_target { 'TestingResource6':
  #  ensure                    => present,
  #  iscsi_target_name         => "puppet-iscsi-target1",
  #  iscsi_target_alias        => "puppet-iscsi-target1",
  #  pool_name                 => "pool-a",
  #  iscsi_target_auth         => "none",
  # #  iscsi_target_chap_name    => "",
  # #  iscsi_target_chap_secret  => "",
  #  iscsi_target_ip           => "10.65.103.83",
  #  iscsi_target_port         => "3260",
  # }

  lun { 'TestingResource1':
    ensure                    => present,
    lun_name                  => "lun1",
    project_name              => "puppet1",
    pool_name                 => "pool-a",
    lun_size                  => 101,
    lun_protocol              => "iSCSI",
    block_size                => "32KB",
    # thin_provision            => "true",
    # compression_class         => "inherit"
    # compression               => "lz4",
    # compressed_log            => "lz4",
    # dedup                     => "inherit",
    # read_cache                => "inherit",
    # primary_cache             => "all",
    # secondary_cache           => "all",
    # readonly                  => "inherit",
    # logbias                   => "latency",
    # write_back_cache          => "enable",
  #  override_project_mappings  => "yes",
  #  lun_mappings               => [["initiator-group3", "iscsi-target-group3", 3, false],["puppet-initiator-group1", "puppet-iscsi-target-group1", 4, false]],
  }

  share { 'TestingResource2':
    ensure                            => present,
    share_name                        => "share1",
    project_name                      => "puppet1",
    pool_name                         => "pool-a",
    # share_protocol                    => "inherit",
    # block_size                        => "128KB",
    # mount_point                       => "/export/custom-mounts/p-s3",
    # dedup                             => "off",
    # compression_class                 => "off",
    # compression                       => "gzip",
    # quota                             => 350,
    # reservation                       => 120,
    # readonly                          => "inherit",
    # logbias                           => "throughput",
    # read_cache                        => "inherit",
    # primary_cache                     => "all",
    # secondary_cache                   => "all",
    # acl_inherit                       => "inherit",
    # override_project_nfs_network_acls => "yes",
    # nfs_network_acls                  => [["IP", "3.3.3.3", "rw", false],["IP", "4.4.4.5", "rw", false]],
  }

  project { 'TestingResource3':
    ensure                     => present,
    project_name               => "puppet1",
    pool_name                  => "pool-a",
    # compression_class          => "Optimal Performance",
    # compression_type           => "off",
    # compressed_log             => "off",
    # intended_protocol_list     => ["nfs","smb"],
    # share_protocol             => "smb+nfs",
    # quota                      => 0,
    # dedup                      => "on",
    # read_cache                 => "off",
    # primary_cache              => "all",
    # secondary_cache            => "all",
    # mount_point                => "/custom-project-mount"
    # default_lun_block_size     => "8KB",
    # default_share_block_size   => "4KB",
    # default_thin_provisioning  => true,
    # default_lun_size           => 322,
    # acl_inherit                => "off",
    # readonly                   => "off",
    # lun_mappings               => [["initiator-group1", "iscsi-target-group1", -1, false],["initiator-group2", "iscsi-target-group2", -1, false]],
    # nfs_network_acls           => [["IP", "1.1.1.1", "rw", false],["IP", "2.2.2.2", "rw", false]],
  }
  






}

