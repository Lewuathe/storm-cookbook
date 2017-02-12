require 'spec_helper'

describe 'storm-cluster::supervisor' do
  let(:chef_run) do
    ChefSpec::ServerRunner.new do |node|
      node.override['storm']['enable_logviewer'] = true
    end.converge(described_recipe)
  end

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

  it 'renders the file /etc/init/storm-supervisor.conf with content from ./spec/rendered_templates/storm-supervisor.conf' do
    storm_supervisor_conf = File.read('./spec/rendered_templates/storm-supervisor.conf')
    expect(chef_run).to render_file('/etc/init/storm-supervisor.conf').with_content(storm_supervisor_conf)
  end

  it 'creates adds the templated file "/etc/init/storm-logviewer.conf"' do
    expect(chef_run).to create_template('/etc/init/storm-logviewer.conf').with(
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
