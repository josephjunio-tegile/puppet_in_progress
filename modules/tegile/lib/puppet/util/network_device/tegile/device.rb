require 'puppet/util/network_device/tegile'
require 'puppet/util/network_device/tegile/facts'
require 'puppet/tegile-puppet'
require 'uri'

class Puppet::Util::NetworkDevice::Tegile::Device

  Puppet.info("##Inside netdev_device_root")

  #attr_accessor :tegile_api
  attr_accessor :tegile_api_transport
  #attr_accessor :transport

  def initialize(url,option = {})
    Puppet.info("##Inside netdev_device_initialize")
    ##Parse url string from device.conf and initialize/Configure TegileApi class
    @parsed_url = URI(url)
    #@transport = TegileApi.new(@parsed_url.host,@parsed_url.user,@parsed_url.password)
    #@tegile_api = TegileApi.new(@parsed_url.host,@parsed_url.user,@parsed_url.password)
    @tegile_api_transport = TegileApi.new(@parsed_url.host,@parsed_url.user,@parsed_url.password)
  end

  def facts
    Puppet.info("##Inside netdev_device_facts")
    ##Creating facts class, calling retrieve method and returning result
    @facts ||= Puppet::Util::NetworkDevice::Tegile::Facts.new(@tegile_api_transport)
    facts = @facts.retrieve
    facts
  end

end
