if RUBY_VERSION.split('.')[1].to_i == 8
  require 'rubygems'
  gem 'json'
end

require 'json'
require 'logger'

# This is a simple wrapper that can use different http clients depending on what's installed.
# The purpose of this is so that users who can't install binaries easily (like windoze users)
# can have fallbacks that work.

module NewRelic


  def self.logger=(logger)
    @logger = logger
  end

  def self.logger()
    @logger
  end

  class Client

    attr_accessor :license, :guid, :version, :options, :logger
    # options:
    # - :gem => specify gem explicitly
    #
    def initialize(options={})

      @license = options[:license]
      @guid = options[:guid]
      @version = options[:version]

      @options = options
      @logger = Logger.new(STDOUT)
      @logger.level = options[:log_level] || Logger::INFO

      @agent = options[:agent] || "newrelic_platform gem"

    end

    def new_collector
      return Collector.new(self)
    end


  end
end
