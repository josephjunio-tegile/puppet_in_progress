Puppet::Type.newtype(:template) do
  @doc = "Type for create/delete template"
  Puppet.info("##Inside type_root_template")
  apply_to_device
  ensurable

  newparam(:template_name) do
    #desc "The name of the host."
    isnamevar
    Puppet.info("##Inside type_param_template_name")
  end

  #newparam(:pool_name) do
    #Puppet.info("##Inside type_param_")
  #end

 end
