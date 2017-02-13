include_recipe 'storm-cluster::common'

# Optionally enable the log viewer service on worker/supervisor nodes

template '/etc/init/storm-logviewer.conf' do
  source 'storm-daemon.conf.erb'
  mode '0644'
  owner 'root'
  group 'root'
  variables(
    :service => 'logviewer'
  )
  only_if node['storm']['enable_logviewer'] == 'true'
end

service 'storm-logviewer' do
  supports :status => true, :restart => true
  provider Chef::Provider::Service::Upstart if node['platform'] == 'ubuntu'
  action :start
  only_if node['storm']['enable_logviewer'] == 'true'
end

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
  provider Chef::Provider::Service::Upstart if node['platform'] == 'ubuntu'
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
