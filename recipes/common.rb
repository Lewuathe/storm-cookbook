include_recipe 'java'

group 'storm' do
  action :create
end

user 'storm' do
  comment "For storm services"
  gid 'storm'
  home '/home/storm'
  shell '/bin/bash'
  action :create
end

directory '/usr/share/storm' do
  owner 'root'
  group 'root'
  mode '0644'
  action :create
end
