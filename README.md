storm-cookbook
==============

!! Caution: This repository is under development

This is chef cookbook for apache storm

Requirements
------------

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
    <td><tt>['storm'][:package]</tt></td>
    <td>String</td>
    <td>Storm package name for constructing storm cluster</td>
    <td><tt>apache-storm-0.10.0-SNAPSHOT</tt></td>
  </tr>
  
  <tr>
    <td><tt>['storm'][:version]</tt></td>
    <td>String</td>
    <td>Storm version</td>
    <td><tt>0.10.0-SNAPSHOT</tt></td>
  </tr>
  
  <tr>
    <td><tt>['storm'][:install_dir]</tt></td>
    <td>String</td>
    <td>Storm package install directory</td>
    <td><tt>/usr/share/storm</tt></td>
  </tr>
  
  <tr>
    <td><tt>['storm'][:zookeeper_ip]</tt></td>
    <td>String</td>
    <td>Zookeeper server IP address</td>
    <td><tt>192.168.50.3</tt></td>
  </tr>

  <tr>
    <td><tt>['storm'][:nimbus_ip]</tt></td>
    <td>String</td>
    <td>Storm nimbus server IP address</td>
    <td><tt>192.168.50.4</tt></td>
  </tr>
  
  
</table>

Usage
-----
#### storm::default


e.g.
Just include `storm` in your node's `run_list`:

For nimbus node
```json
{
  "name":"nimbus_host",
  "run_list": [
    "storm::nimbus"
  ]
}
```

For supervisor node
```json
{
  "name":"supervisor_host",
  "run_list": [
    "storm::supervisor"
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
Authors: Kai Sasaki([Lewuathe](https://github.com/Lewuathe))
