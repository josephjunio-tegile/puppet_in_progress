require 'puppet/util/network_device/tegile'
require 'puppet/tegile-puppet'

class Puppet::Util::NetworkDevice::Tegile::Facts

  Puppet.info("##Inside netdev_facts_root")

  attr_reader :tegile_api_transport

  def initialize(tegile_api_transport)
    Puppet.info("##Inside netdev_facts_initialize")
    @tegile_api_transport = tegile_api_transport
  end

  def retrieve
    Puppet.info("##Inside netdev_facts_retrieve")
    ##Create empty hash and return it, this is where you would collect system info
    @facts = {}
    @facts
  end
end
