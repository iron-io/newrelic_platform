module NewRelic

  class Collector

    attr_accessor :client, :components

    def initialize(client)

      @client = client
      @components = {}

    end

    # options:
    #   :duration => time interval between metrics in seconds. default is 60.
    def component(component_name, options={})
      @components[component_name] ||= Component.new(self, component_name, options)
      @components[component_name]
    end


    # options:
    #
    def submit(options={})
      # build components array
      components_array = []
      components.each_pair do |k, c|
        p c
        components_array << {
          :name => c.name,
          :guid => client.guid,
          :duration => c.options[:duration] || 60,
          :metrics => c.metrics
        }
      end

      body = {
        :agent => {
          :version => client.version,
          :pid => 1,
          :host => "whatever"
        },
        :components => components_array
      }

      headers = {
        'Content-Type' => 'application/json',
        'Accept' => 'application/json',
        'X-License-Key' => client.license
      }
      puts "headers: #{headers.inspect}"
      p body
      response = Rest::Client.new.post('http://platform-api.newrelic.com/platform/v1/metrics',
                                       :body => body.to_json,
                                       :headers => headers)
      JSON.parse(response.body)

    end


  end

  class Component

    attr_accessor :collector, :name, :metrics, :options

    def initialize(collector, name, options={})
      @collector = collector
      @name = name
      @metrics = {}
      @options = options
    end

    def add_metric(metric_name, units, value)
      @metrics["Component/#{metric_name}[#{units}]"] = value
    end
  end
end
