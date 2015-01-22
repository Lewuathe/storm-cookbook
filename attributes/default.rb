default['storm']['version'] = '0.9.3'
default['storm']['package'] = "apache-storm-#{node['storm']['version']}"
default['storm']['install_dir'] = '/usr/share/storm'
default['storm']['zookeeper_ip'] = '192.168.50.3'
default['storm']['nimbus_ip'] = '192.168.50.4'
