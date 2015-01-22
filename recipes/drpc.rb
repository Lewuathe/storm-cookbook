include_recipe 'storm-cluster::common'

template "/etc/init/storm-drpc.conf" do
  source 'storm-daemon.conf.erb'
  mode '0644'
  owner 'root'
  group 'root'
  variables({
    :service => 'drpc'
  })
end

service 'storm-drpc' do
  supports :status => true, :restart => true
  if node['platform'] == 'ubuntu' and node['platform_version'] == '14.04'
    then provider Chef::Provider::Service::Upstart
  end
  action :start
end
