New Relic HTTP API Ruby Wrapper
----------------------

Ruby wrapper around the New Relic HTTP API. Makes it very easy to post component and metric data to the API.


Getting Started
================

Install the Gem
----------

The gem is currently private so you'll need to clone this repo and then install the gem.

    gem install ./newrelic_platform-0.0.2.gem


Create the client
------

```
new_relic = NewRelic::Client.new(:license => YOUR_NEW_RELIC_LICENSE,
                                  :guid => YOUR_GUID,
                                  :version => '0.0.1')
```


Create the Collector
-----

```
collector = new_relic.new_collector
```


Create the component
------

```
component = collector.component("COMPONENT_NAME")
```




Add Metrics
-------- 

```
component.add_metric 'Widgets Sold', 'widgets', 1000
component.add_metric 'Widget Rate', 'widgets/sec', 5
```



Post the data to New Relic
---------
```
response = collector.submit
```


That's it.