default['storm']['version'] = '0.9.3'
default['storm']['package'] = "apache-storm-#{node['storm']['version']}"
default['storm']['install_dir'] = '/usr/share/storm'

default['storm']['storm_yaml']['storm.zookeeper.servers'] = '192.168.50.3'
default['storm']['storm_yaml']['nimbus.host'] = '192.168.50.4'
default['storm']['storm_yaml']['drpc.servers'] = '192.168.50.8'
