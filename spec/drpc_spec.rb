require 'spec_helper'

describe 'storm-cluster::drpc' do
  cached(:chef_run) { ChefSpec::ServerRunner.converge(described_recipe) }

  it 'Includes the common recipe' do
    expect(chef_run).to include_recipe('storm-cluster::common')
  end

  it 'creates adds the templated file "/etc/init/storm-drpc.conf"' do
    expect(chef_run).to create_template('/etc/init/storm-drpc.conf').with(
      source: 'storm-daemon.conf.erb',
      mode:   '0644',
      owner:  'root',
      group:  'root'
    )
  end

  it 'renders the file /etc/init/storm-drpc.conf with content from ./spec/rendered_templates/storm-drpc.conf' do
    storm_drpc_conf = File.read('./spec/rendered_templates/storm-drpc.conf')
    expect(chef_run).to render_file('/etc/init/storm-drpc.conf').with_content(storm_drpc_conf)
  end

  it 'starts the storm-drpc service' do
    expect(chef_run).to start_service('storm-drpc')
  end
end
