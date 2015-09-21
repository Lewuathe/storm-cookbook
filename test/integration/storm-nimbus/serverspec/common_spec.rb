require 'spec_helper'

describe file('/tmp/config_hosts.sh') do
  it { should be_file }
end

#describe group('storm_user') do
#  it { should exist }
#end

#describe user('storm_user') do
#  it { should exist }
#end

#describe file($node['storm']['install_dir']) do
#  it { should be_directory }
#end

describe file('/usr/share/storm') do
  it { should be_directory }
end
