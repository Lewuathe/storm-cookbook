default['storm']['version'] = '0.9.3'
default['storm']['package'] = "apache-storm-#{node['storm']['version']}"
default['storm']['install_dir'] = '/usr/share/storm'
default['storm']['user'] = 'storm'

default['storm']['install_method'] = 'cookbook_file'

default['storm']['download_url'] = 'http://mirror.sdunix.com/apache/storm'
default['storm']['download_dir'] = "/apache-storm-#{node['storm']['version']}/apache-storm-#{node['storm']['version']}.tar.gz"
