include_recipe 'java'

storm_user = node['storm']['user']
storm_package_name = node['storm']['package']
storm_version = node['storm']['version']
storm_remote_name = "#{node['storm']['download_url']}#{node['storm']['download_dir']}"
install_dir = node['storm']['install_dir']

cookbook_file 'config_hosts.sh' do
  path '/tmp/config_hosts.sh'
  mode '0755'
  action :create
end

script 'config_hosts' do
  interpreter 'bash'
  user 'root'
  code <<-EOL
     ./tmp/config_hosts.sh
  EOL
end

group storm_user do
  action :create
end

user storm_user do
  comment 'For storm services'
  gid storm_user
  home "/home/#{storm_user}"
  shell '/bin/bash'
  action :create
end

directory node['storm']['install_dir'] do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

case node['storm']['install_method']
when 'cookbook_file'
  cookbook_file "/tmp/#{storm_package_name}.tar.gz" do
    source "#{storm_package_name}.tar.gz"
  end
when 'remote_file'
  remote_file "/tmp/#{storm_package_name}.tar.gz" do # ~FC013
    source storm_remote_name
  end
end

script 'install_storm' do
  interpreter 'bash'
  user 'root'
  code <<-EOL
    tar zxvf /tmp/#{storm_package_name}.tar.gz -C #{install_dir}
    rm -rf #{install_dir}/#{storm_version}
    mv #{install_dir}/#{storm_package_name} #{install_dir}/#{storm_version}
    chown -R #{storm_user}:#{storm_user} #{install_dir}/#{storm_version}
  EOL
  not_if { ::File.exist?("#{install_dir}/#{storm_version}") }
end

template "#{install_dir}/#{storm_version}/conf/storm.yaml" do
  source 'storm.yaml.erb'
  mode '0644'
  owner storm_user
  group storm_user
  variables(
    'storm_yaml' => node['storm']['storm_yaml']
  )
end
