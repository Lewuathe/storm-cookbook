include_recipe 'storm::common'

storm_package_name = node['storm'][:package]
storm_version = node['storm'][:version] 
install_dir = node['storm'][:install_dir]

cookbook_file "/tmp/#{storm_package_name}.tar.gz" do
  source "#{storm_package_name}.tar.gz"
end

script "install_storm" do
  interpreter "bash"
  user        "root"
  code <<-EOL
    tar zxvf /tmp/#{storm_package_name}.tar.gz -C #{install_dir}
    rm -rf #{install_dir}/#{storm_version}
    mv #{install_dir}/#{storm_package_name} #{install_dir}/#{storm_version}
    chown -R storm:storm #{install_dir}/#{storm_version}
  EOL
end

template "#{install_dir}/#{storm_version}/conf/storm.yaml" do
  source 'storm.yaml.erb'
  mode '0440'
  owner 'root'
  group 'root'
  variables({
    :nimbus_ip => node['storm'][:nimbus_ip],
    :zookeeper_ip => node['storm'][:zookeeper_ip]
  })
end

template "/etc/init/storm-nimbus.conf" do
  source 'storm-daemon.conf.erb'
  mode '0644'
  owner 'root'
  group 'root'
  variables({
    :service => 'nimbus'
  })
end

template "/etc/init/storm-ui.conf" do
  source 'storm-daemon.conf.erb'
  mode '0644'
  owner 'root'
  group 'root'
  variables({
    :service => 'ui'
  })
end

service 'storm-nimbus' do
  action :start
end

service 'storm-ui' do
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
