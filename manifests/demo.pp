node 'tegile-3.7_demo' {

  ##VMWARE-SAN-Config
  initiator_group { 'VMware-InitiatorGroup1':
   ensure                => present,
   initiator_group_name  => "vmware-ig-1",
  }

  initiator_group { 'VMware-InitiatorGroup2':
   ensure                => present,
   initiator_group_name  => "vmware-ig-2",
  }

  initiator_group { 'VMware-InitiatorGroup3':
   ensure                => present,
   initiator_group_name  => "vmware-ig-3",
  }

  initiator_group { 'VMware-InitiatorGroup4':
   ensure                => present,
   initiator_group_name  => "vmware-ig-4",
  }

  initiator { 'VMware-Initiator1':
   ensure                    => present,
   initiator_name            => "iqn.2017-07.com.test:vmware-host1",
   initiator_group_name      => "vmware-ig-1",
  }

  initiator { 'VMware-Initiator2':
   ensure                    => present,
   initiator_name            => "iqn.2017-07.com.test:vmware-host2",
   initiator_group_name      => "vmware-ig-2",
  }

  initiator { 'VMware-Initiator3':
   ensure                    => present,
   initiator_name            => "iqn.2017-07.com.test:vmware-host3",
   initiator_group_name      => "vmware-ig-3",
  }

  initiator { 'VMware-Initiator4':
   ensure                    => present,
   initiator_name            => "iqn.2017-07.com.test:vmware-host4",
   initiator_group_name      => "vmware-ig-4",
  }

  iscsi_target_group { 'VMware-TargetGroup1':
    ensure                  => present,
    iscsi_target_group_name => "vmware-tg-1",
    pool_name               => "pool-a",
  }

  iscsi_target { 'VMware-Target1':
   ensure                    => present,
   iscsi_target_name         => "vmware-iscsi-target1",
   iscsi_target_alias        => "vmware-iscsi-target1",
   iscsi_target_group        => "vmware-tg-1",
   iscsi_target_ip           => "10.65.3.33",
   iscsi_target_port         => "3260",
  }




  ##VMWare-LUN-Config
  project { 'VMware-iSCSI':
   ensure                     => present,
   project_name               => "vmware-iscsi",
   pool_name                  => "pool-a",
   compression_type           => "lz4",
   compressed_log             => "lz4",
   dedup                      => "on",
   quota                      => 2096,
   default_thin_provisioning  => true,
   intended_protocol_list     => ["iSCSI"],
   lun_mappings               => [["vmware-ig-1", "vmware-tg-1", -1, false],["vmware-ig-2", "vmware-tg-1", -1, false]],
  }

  lun { 'VMware-LUN1':
   ensure                     => present,
   lun_name                   => "vmware-lun1",
   project_name               => "vmware-iscsi",
   pool_name                  => "pool-a",
   lun_size                   => 100,
   block_size                 => "32KB",
   lun_protocol               => "iSCSI",
   override_project_mappings  => "no",
  }

  lun { 'VMware-LUN2':
   ensure                     => present,
   lun_name                   => "vmware-lun2",
   project_name               => "vmware-iscsi",
   pool_name                  => "pool-a",
   lun_size                   => 200,
   block_size                 => "64KB",
   lun_protocol               => "iSCSI",
   override_project_mappings  => "yes",
   lun_mappings               => [["vmware-ig-3", "vmware-tg-1", -1, false],["vmware-ig-4", "vmware-tg-1", -1, false]],
  }






  ##VMWare-Share-Config
  project { 'VMware-NFS':
   ensure                     => present,
   project_name               => "vmware-nfs",
   pool_name                  => "pool-a",
   compression_type           => "lz4",
   compressed_log             => "lz4",
   dedup                      => "on",
   quota                      => 1536,
   default_thin_provisioning  => true,
   intended_protocol_list     => ["nfs"],
   nfs_network_acls           => [["IP", "1.1.1.1", "rw", false],["IP", "2.2.2.2", "rw", false]],
  }

  share { 'VMware-Share1':
   ensure                            => present,
   share_name                        => "vmware-share1",
   project_name                      => "vmware-nfs",
   pool_name                         => "pool-a",
   block_size                        => "32KB",
   override_project_nfs_network_acls => "no",
  }

  share { 'VMware-Share2':
   ensure                            => present,
   share_name                        => "vmware-share2",
   project_name                      => "vmware-nfs",
   pool_name                         => "pool-a",
   block_size                        => "64KB",
   override_project_nfs_network_acls => "yes",
   nfs_network_acls                  => [["IP", "3.3.3.3", "rw", false],["IP", "4.4.4.4", "rw", false]],
  }






#   ##SQL-SAN-Config
#   initiator { 'SQL-Initiator':
#    ensure                    => present,
#    initiator_name            => "iqn.2017-07.com.test:sql-host",
#    initiator_group_name      => "sql-ig",
#   }

#   initiator_group { 'SQL-InitiatorGroup':
#    ensure                => present,
#    initiator_group_name  => "sql-ig",
#   }

#   iscsi_target { 'SQL-Target':
#    ensure                    => present,
#    iscsi_target_name         => "sql-iscsi-target",
#    iscsi_target_alias        => "sql-iscsi-target",
#    iscsi_target_group        => "sql-tg",
#    iscsi_target_ip           => "10.65.3.33",
#    iscsi_target_port         => "3260",
#   }

#   iscsi_target_group { 'SQL-TargetGroup':
#     ensure                  => present,
#     iscsi_target_group_name => "sql-tg",
#     pool_name               => "pool-a",
#   }

#   ##SQL-LUN-Config
#   project { 'SQL-Project':
#    ensure                     => present,
#    project_name               => "sql-project",
#    pool_name                  => "pool-a",
#    compression_type           => "lz4",
#    compressed_log             => "lz4",
#    dedup                      => "on",
#    default_thin_provisioning  => true,
#    intended_protocol_list     => ["iSCSI"],
#    lun_mappings               => [["sql-ig", "sql-tg", -1, false]],
#   }

#   lun { 'SQL-LUN1':
#    ensure                     => present,
#    lun_name                   => "sql-lun1",
#    project_name               => "sql-project",
#    pool_name                  => "pool-a",
#    lun_size                   => 500,
#    block_size                 => "15KB",
#    lun_protocol               => "iSCSI",
#   }

#   lun { 'SQL-LUN2':
#    ensure                     => present,
#    lun_name                   => "sql-lun2",
#    project_name               => "sql-project",
#    pool_name                  => "pool-a",
#    lun_size                   => 600,
#    block_size                 => "32KB",
#    lun_protocol               => "iSCSI",
#   }

#   lun { 'SQL-LUN3':
#    ensure                     => present,
#    lun_name                   => "sql-lun3",
#    project_name               => "sql-project",
#    pool_name                  => "pool-a",
#    lun_size                   => 250,
#    block_size                 => "64KB",
#    lun_protocol               => "iSCSI",
#   }

#   lun { 'SQL-LUN4':
#    ensure                     => present,
#    lun_name                   => "sql-lun4",
#    project_name               => "sql-project",
#    pool_name                  => "pool-a",
#    lun_size                   => 1024,
#    block_size                 => "16KB",
#    lun_protocol               => "iSCSI",
#   }

#   lun { 'SQL-LUN5':
#    ensure                     => present,
#    lun_name                   => "sql-lun5",
#    project_name               => "sql-project",
#    pool_name                  => "pool-a",
#    lun_size                   => 3072,
#    block_size                 => "128KB",
#    lun_protocol               => "iSCSI",
#   }



}

