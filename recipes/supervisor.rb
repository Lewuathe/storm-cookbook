include_recipe 'storm::common'

storm_package_name = node['storm'][:package]
storm_version = node['storm'][:version] 
install_dir = node['storm'][:install_dir]

template "/etc/init/storm-supervisor.conf" do
  source 'storm-daemon.conf.erb'
  mode '0644'
  owner 'root'
  group 'root'
  variables({
    :service => 'supervisor'
  })
end

service 'storm-supervisor' do
  action :start
end


#script "start_nimbus" do
#  interpreter "bash"
#  user "storm"
#  code <<-EOL
#    #{install_dir}/#{storm_version}/bin/storm nimbus
#  EOL
#end
#
#script "start_ui" do
#  interpreter "bash"
#  user "storm"
#  code <<-EOL
#    #{install_dir}/#{storm_version}/bin/storm ui
#  EOL
#end
