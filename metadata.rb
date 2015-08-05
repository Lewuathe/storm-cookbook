name 'storm-cluster'
maintainer 'Kai Sasaki'
maintainer_email 'lewuathe@me.com'
license 'MIT License'
description 'Installs/Configures storm'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.0.19'
depends 'java'
begin
  source_url 'https://github.com/Lewuathe/storm-cookbook'
  issues_url 'https://github.com/Lewuathe/storm-cookbook/issues'
rescue NoMethodError
  nil
end
provides 'storm-cluster::nimbus'
provides 'storm-cluster::supervisor'
supports 'ubuntu'
