require 'puppet/util/network_device/tegile/device'

class Puppet::Provider::Tegile < Puppet::Provider
  Puppet.info("##Inside provider_root_tegile")

=begin
  def self.transport
    @device ||= Puppet::Util::NetworkDevice.current
    @transport = @device.transport
  end

  def transport
    # this calls the class instance of self.transport instead of the object instance which causes an infinite loop.
    self.class.transport
  end

  def self.tegile_api
    @device ||= Puppet::Util::NetworkDevice.current
    @tegile_api = @device.tegile_api
  end

  def tegile_api
    # this calls the class instance of self.tegile_api instead of the object instance which causes an infinite loop.
    self.class.tegile_api
  end
=end

  def self.tegile_api_transport
    @device ||= Puppet::Util::NetworkDevice.current
    @tegile_api_transport = @device.tegile_api_transport
  end

  def tegile_api_transport
    # this calls the class instance of self.tegile_api_transport instead of the object instance which causes an infinite loop.
    self.class.tegile_api_transport
  end

end
