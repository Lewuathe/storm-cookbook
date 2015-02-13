include_recipe 'storm-cluster::common'

template '/etc/init/storm-supervisor.conf' do
  source 'storm-daemon.conf.erb'
  mode '0644'
  owner 'root'
  group 'root'
  variables(
    :service => 'supervisor'
  )
end

service 'storm-supervisor' do
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
