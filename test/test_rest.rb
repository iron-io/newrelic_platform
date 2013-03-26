# Put config.yml file in ~/Dropbox/configs/ironmq_gem/test/config.yml

require 'test/unit'
require 'yaml'
require File.expand_path('test_base', File.dirname(__FILE__))

class TestRest < TestBase
  def setup
    super

  end

  def test_basics
    collector = @new_relic.new_collector
    collector.component("Test Gem Component").add_metric 'testgem2', 'messages', 10
    collector.component("Other component").add_metric 'testgem3', 'messages', 20
    r = collector.submit
    p r
  end

end

