include_recipe 'storm-cluster::common'

template '/etc/init/storm-nimbus.conf' do
  source 'storm-daemon.conf.erb'
  mode '0644'
  owner 'root'
  group 'root'
  variables(
    :service => 'nimbus'
  )
end

template '/etc/init/storm-ui.conf' do
  source 'storm-daemon.conf.erb'
  mode '0644'
  owner 'root'
  group 'root'
  variables(
    :service => 'ui'
  )
end

service 'storm-nimbus' do
  supports :status => true, :restart => true
  if node['platform'] == 'ubuntu' and node['platform_version'] == '14.04'
    then provider Chef::Provider::Service::Upstart
  end
  action :start
end

service 'storm-ui' do
  supports :status => true, :restart => true
  if node['platform'] == 'ubuntu' and node['platform_version'] == '14.04'
    then provider Chef::Provider::Service::Upstart
  end
  action :start
end

# script 'start_nimbus' do
#  interpreter 'bash'
#  user 'storm'
#  code <<-EOL
#    #{install_dir}/#{storm_version}/bin/storm nimbus
#  EOL
# end
#
# script 'start_ui' do
#  interpreter 'bash'
#  user 'storm'
#  code <<-EOL
#    #{install_dir}/#{storm_version}/bin/storm ui
#  EOL
# end
