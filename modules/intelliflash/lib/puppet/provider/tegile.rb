require 'puppet/util/network_device/tegile/device'

class Puppet::Provider::Tegile < Puppet::Provider
  Puppet.info("##Inside provider_root_tegile")

  def self.tegile_api_transport
    @device ||= Puppet::Util::NetworkDevice.current
    @tegile_api_transport = @device.tegile_api_transport
  end

  def tegile_api_transport
    # this calls the class instance of self.tegile_api_transport instead of the object instance which causes an infinite loop.
    self.class.tegile_api_transport
  end

end
