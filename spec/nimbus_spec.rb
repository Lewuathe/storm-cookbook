require 'spec_helper'

describe 'storm-cluster::nimbus' do
  cached(:chef_run) { ChefSpec::ServerRunner.converge(described_recipe) }

  it 'Includes the common recipe' do
    expect(chef_run).to include_recipe('storm-cluster::common')
  end

  it 'adds the template /etc/init/storm-nimbus.conf' do
    expect(chef_run).to create_template('/etc/init/storm-nimbus.conf').with(
      source: 'storm-daemon.conf.erb',
      mode:   '0644',
      owner:  'root',
      group:  'root'
    )
  end

  it 'renders the file /etc/init/storm-nimbus.conf with content from ./spec/rendered_templates/storm-nimbus.conf' do
    storm_nimbus_conf = File.read('./spec/rendered_templates/storm-nimbus.conf')
    expect(chef_run).to render_file('/etc/init/storm-nimbus.conf').with_content(storm_nimbus_conf)
  end

  it 'adds the template /etc/init/storm-ui.conf' do
    expect(chef_run).to create_template('/etc/init/storm-ui.conf').with(
      source: 'storm-daemon.conf.erb',
      mode:   '0644',
      owner:  'root',
      group:  'root'
    )
  end

  it 'renders the file /etc/init/storm-ui.conf with content from ./spec/rendered_templates/storm-ui.conf' do
    storm_ui_conf = File.read('./spec/rendered_templates/storm-ui.conf')
    expect(chef_run).to render_file('/etc/init/storm-ui.conf').with_content(storm_ui_conf)
  end

  it 'starts the storm-nimbus service' do
    expect(chef_run).to start_service('storm-nimbus')
  end

  it 'starts the storm-ui service' do
    expect(chef_run).to start_service('storm-ui')
  end
end
