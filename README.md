storm-cookbook [![Build Status](https://travis-ci.org/Lewuathe/storm-cookbook.svg?branch=master)](https://travis-ci.org/Lewuathe/storm-cookbook)
==============

This is a chef cookbook for [apache storm](http://storm.apache.org/)

Download
----------
[storm-cluster: Chef Supermarket](https://supermarket.chef.io/cookbooks/storm-cluster)

Requirements
------------
Chef: 11.18.0+
java

Attributes
----------

#### storm::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['storm']['package']</tt></td>
    <td>String</td>
    <td>Storm package name for constructing storm cluster</td>
    <td><tt>apache-storm-0.10.0-SNAPSHOT</tt></td>
  </tr>
  
  <tr>
    <td><tt>['storm']['version']</tt></td>
    <td>String</td>
    <td>Storm version</td>
    <td><tt>0.10.0-SNAPSHOT</tt></td>
  </tr>
  
  <tr>
    <td><tt>['storm']['install_dir']</tt></td>
    <td>String</td>
    <td>Storm package install directory</td>
    <td><tt>/usr/share/storm</tt></td>
  </tr>
  
  <tr>
    <td><tt>['storm']['install_method']</tt></td>
    <td>String</td>
    <td>Set to remote_file to download from storm.apache.org</td>
    <td><tt>cookbook_file</tt></td>
  </tr>
  
</table>

All storm.yaml options are supported through the node['storm']['storm_yaml'] not object.  See the attributes/storm_yaml.rb for more details.

At a minimum you will need create a role/environment/wrapper with the following options:

<pre>
"storm": {
  "storm_yaml": {
    "nimbus.host": "nimbus.example.com",
    "storm.zookeeper.servers": [
      "zookeeper1.example.com"
    ]
  }
}
</pre>

Usage
-----
First you have to add your storm package under `files/default` as tar.gz format.

```
$ cp <your storm package> cookbooks/storm-cluster/files/default/
```

## Recipes

e.g.
Just include `storm` in your node's `run_list`:

### storm::nimbus
For nimbus node
```json
{
  "name":"nimbus_host",
  "run_list": [
    "storm::nimbus"
  ]
}
```

### storm::supervisor
For supervisor node
```json
{
  "name":"supervisor_host",
  "run_list": [
    "storm::supervisor"
  ]
}
```

### storm::drpc
For DRPC server
```json
{
  "name": "drpc_host",
  "run_list": [
    "storm::drpc"
  ] 
}
```

Contributing
------------

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: 
* Kai Sasaki([Lewuathe](https://github.com/Lewuathe))
* Bill Warner([TD-4242](https://github.com/TD-4242))


This cookbook is distributed under [MIT License](http://opensource.org/licenses/MIT)
