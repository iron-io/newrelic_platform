module NewRelic

  class Collector

    attr_accessor :client, :components

    def initialize(client)

      @client = client
      @components = {}

    end

    def component(component_name)
      @components[component_name] ||= Component.new(self, component_name)
      @components[component_name]
    end


    # req_hash options:
    # - :body => post body
    #
    def submit(options={})
      # build components array
      components_array = []
      components.each_pair do |k, c|
        p c
        components_array << {
          :name => c.name,
          :guid => client.guid,
          :duration => 60,
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
      response = Rest::Client.new.post('https://platform-api.newrelic.com/platform/v1/metrics',
                                       :body => body.to_json,
                                       :headers => headers)
      JSON.parse(response.body)

    end


  end

  class Component

    attr_accessor :collector, :name, :metrics

    def initialize(collector, name)
      @collector = collector
      @name = name
      @metrics = {}
    end

    def add_metric(metric_name, units, value)
      @metrics["Component/#{metric_name}[#{units}]"] = value
    end
  end
end
