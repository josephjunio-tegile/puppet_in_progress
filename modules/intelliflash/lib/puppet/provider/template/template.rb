require 'puppet/provider/tegile'

Puppet::Type.type(:template).provide(:lun,:parent => Puppet::Provider::Tegile) do
  desc "Provider for template create/delete"
  Puppet.info("##Inside provider_root_template")

  def create
    Puppet.info("##Inside provider_template_create")
    #tegile_api_transport.
  end

  def destroy
    Puppet.info("##Inside provider_template_destroy")
    #tegile_api_transport.
  end

  def exists?
    Puppet.info("##Inside provider_template_exists")
    #tegile_api_transport. (resource[:template])
  end

end
