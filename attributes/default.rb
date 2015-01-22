default['storm']['version'] = '0.9.3'
default['storm']['package'] = "apache-storm-#{node['storm']['version']}"
default['storm']['install_dir'] = '/usr/share/storm'
default['storm']['zookeeper_ips'] = []
default['storm']['nimbus_ip'] = 'nimbus'

default['storm']['install_method'] = 'cookbook_file'

default['storm']['download_url'] = 'http://www.apache.org/dyn/closer.cgi/storm'
default['storm']['download_dir'] = "/apache-storm-#{node['storm']['version']}/apache-storm-#{node['storm']['version']}.tar.gz"
