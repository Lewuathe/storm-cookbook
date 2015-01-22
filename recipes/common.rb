include_recipe 'java'

storm_package_name = node['storm']['package']
storm_version = node['storm']['version']
install_dir = node['storm']['install_dir']

group 'storm' do
  action :create
end

user 'storm' do
  comment 'For storm services'
  gid 'storm'
  home '/home/storm'
  shell '/bin/bash'
  action :create
end

directory '/usr/share/storm' do
  owner 'root'
  group 'root'
  mode '0644'
  action :create
end

cookbook_file "/tmp/#{storm_package_name}.tar.gz" do
  source "#{storm_package_name}.tar.gz"
end

script 'install_storm' do
  interpreter 'bash'
  user 'root'
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
end
