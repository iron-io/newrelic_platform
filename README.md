# New Relic HTTP API Ruby Wrapper

Ruby wrapper around the New Relic HTTP API. Makes it very easy to post component and metric data to the API.

## Getting Started

### Install the Gem

    gem install newrelic_platform

Or in Gemfile:

    gem 'newrelic_platform'

### Create the client

```
new_relic = NewRelic::Client.new(:license => YOUR_NEW_RELIC_LICENSE,
                                  :guid => YOUR_GUID,
                                  :version => '0.0.1')
```

### Create the Collector

```
collector = new_relic.new_collector
```

### Create the component

```
component = collector.component("COMPONENT_NAME")
```

### Add Metrics

```
component.add_metric 'Widgets Sold', 'widgets', 1000
component.add_metric 'Widget Rate', 'widgets/sec', 5
```

### Post the data to New Relic

```
response = collector.submit
```

Boom. Data.

## Further Reading

You can use IronWorker by [Iron.io](http://www.iron.io) to easily schedule a collector agent so that it runs 
every minute (or any schedule), no servers required. Here are some examples using this gem:

- https://github.com/iron-io/newrelic_twilio_plugin
- https://github.com/iron-io/newrelic_airbrake_plugin
- https://github.com/iron-io/newrelic_ironmq_plugin
- https://github.com/iron-io/newrelic_desk_plugin

