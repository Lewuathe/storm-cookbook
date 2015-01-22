default['storm']['version'] = '0.9.3'
default['storm']['package'] = "apache-storm-#{node['storm']['version']}"
default['storm']['install_dir'] = '/usr/share/storm'
default['storm']['zookeeper_ips'] = []
default['storm']['nimbus_ip'] = 'nimbus'
