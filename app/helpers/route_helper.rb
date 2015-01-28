helpers do

  def jsonify(route)
    JSON.parse(route.to_json)
  end

  module RouteAccessor
    Route = Struct.new(:route) do

    def list_inbound_stops
      list = {}
      self.inbound_stops.each do |stop|
        list[stop["table"]["tag"]] = stop["table"]["title"]
      end
      list
    end

    def list_outbound_stops
      list = {}
      self.outbound_stops.each do |stop|
        list[stop["table"]["tag"]] = stop["table"]["title"]
      end
      list
    end

    def inbound_stops
      route["table"]["directions"][0]["table"]["stops"]
    end

    def outbound_stops
      route["table"]["directions"][1]["table"]["stops"]
    end
  end

end

