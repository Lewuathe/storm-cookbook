require 'spec_helper'

describe 'storm-cluster::nimbus' do
  cached(:chef_run) { ChefSpec::ServerRunner.converge(described_recipe) }

  it 'Includes the java recipe' do
    expect(chef_run).to include_recipe('java')
  end

  it 'adds the storm group to the system' do
    expect(chef_run).to create_group('storm')
  end

  it 'adds the storm user to run the storm application as' do
    expect(chef_run).to create_user('storm').with(
      comment: 'For storm services',
      group:     'storm',
      home:    '/home/storm',
      shell:   '/bin/bash'
   )
  end

  it 'creates the directory /usr/share/storm' do
    expect(chef_run).to create_directory('/usr/share/storm').with(
      owner: 'root',
      group: 'root',
      mode:  '0644'
    )
  end

  it 'creates the file "/tmp/apache-storm-0.10.0-SNAPSHOT.tar.gz"' do
    expect(chef_run).to create_cookbook_file(
      '/tmp/apache-storm-0.10.0-SNAPSHOT.tar.gz').with(
        source: 'apache-storm-0.10.0-SNAPSHOT.tar.gz'
    )
  end

  it 'creates the file "/tmp/config_hosts.sh"' do
    expect(chef_run).to create_cookbook_file(
      '/tmp/config_hosts.sh').with(
        source: 'config_hosts.sh'
    )
  end

  it 'runs the install script' do
    expect(chef_run).to run_script('install_storm').with(
      interpreter: 'bash',
      user:        'root'
    )
  end

  it 'adds the tempalted file /usr/share/storm/apache-storm-0.10.0-SNAPSHOT/conf/storm.yaml' do
    expect(chef_run).to create_template(
      '/usr/share/storm/0.10.0-SNAPSHOT/conf/storm.yaml').with(
        source: 'storm.yaml.erb',
        mode:   '0440',
        owner:  'root',
        group:  'root'
    )
  end
end
