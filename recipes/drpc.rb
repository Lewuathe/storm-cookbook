include_recipe 'storm-cluster::common'

template '/etc/init/storm-drpc.conf' do
  source 'storm-daemon.conf.erb'
  mode '0644'
  owner 'root'
  group 'root'
  variables(
             :service => 'drpc'
  )
end

service 'storm-drpc' do
  action :start
end
