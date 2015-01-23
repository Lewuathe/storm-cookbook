require 'spec_helper'

describe 'storm-cluster::supervisor' do
  cached(:chef_run) { ChefSpec::ServerRunner.converge(described_recipe) }

  it 'Includes the common recipe' do
    expect(chef_run).to include_recipe('storm-cluster::common')
  end

  it 'creates adds the templated file "/etc/init/storm-supervisor.conf"' do
    expect(chef_run).to create_template('/etc/init/storm-supervisor.conf').with(
      source: 'storm-daemon.conf.erb',
      mode:   '0644',
      owner:  'root',
      group:  'root'
    )
  end

  it 'starts the storm-supervisor service' do
    expect(chef_run).to start_service('storm-supervisor')
  end
end
