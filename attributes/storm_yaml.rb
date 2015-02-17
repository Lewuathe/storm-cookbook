########### These MUST be filled in for a storm configuration
default['storm']['storm_yaml']['nimbus.host'] = ''
default['storm']['storm_yaml']['storm.zookeeper.servers'] = ['']
#
#
# ##### These may optionally be filled in:
#
## List of custom serializations
# default['storm']['storm_yaml']['topology.kryo.register] = [
#     'org.mycompany.MyType',
#     { 'org.mycompany.MyType2' => 'org.mycompany.MyType2Serializer' }
# ]
#
## List of custom kryo decorators
# default['storm']['storm_yaml']['topology.kryo.decorators'] = ['org.mycompany.MyDecorator']
#
## Locations of the drpc servers
# default['storm']['storm_yaml']['drpc.servers'] = ['server1', 'server2']
#
## Metrics Consumers
# default['storm']['storm_yaml']['topology.metrics.consumer.register'] = [
#   'class' => 'backtype.storm.metric.LoggingMetricsConsumer',
#     { 'parallelism.hint' => 1 },
#   'class' => 'org.mycompany.MyMetricsConsumer',
#     { 'parallelism.hint' => 1 },
#     { 'argument' => [{ 'endpoint' => 'metrics-collector.mycompany.org'}]
