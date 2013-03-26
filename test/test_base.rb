require 'test/unit'
require 'yaml'
require 'uber_config'

begin
  require File.join(File.dirname(__FILE__), '../lib/newrelic_platform')
rescue Exception => ex
  puts "Could NOT load gem: " + ex.message
  raise ex
end

class TestBase < Test::Unit::TestCase

  def setup
    puts 'setup'

    @config = UberConfig.load
    p @config

    @new_relic = NewRelic::Client.new(:license => @config['newrelic_license'], :guid=>"testeroni", :version=>"0.0.1", :log_level=>Logger::DEBUG)

  end


end
