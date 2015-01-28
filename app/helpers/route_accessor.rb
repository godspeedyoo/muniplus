helpers do

  def jsonify(route)
    JSON.parse(route.to_json)
  end

  module RouteAccessor
    Route = Struct.new(:route) do

      def directions
        directions = []
        directions << route["table"]["directions"][0..1]["table"]["name"]
        directions
      end

      def tag(stop)
        stop["table"]["tag"]
      end

      def title(stop)
        stop["table"]["title"]
      end

      def inbound_stops
        self[0]["table"]["directions"][0]["table"]["stops"]
      end

      def outbound_stops
        self[0]["table"]["directions"][1]["table"]["stops"]
      end

      def list_inbound_stops
        list = {}
        self.inbound_stops.each do |stop|
          list[tag(stop)] = title(stop)
        end
        list
      end

      def list_outbound_stops
        list = {}
        self.outbound_stops.each do |stop|
          list[tag(stop)] = title(stop)
        end
        list
      end



    end
  end


end



# @route[0]["table"]["directions"][0]["table"]["stops"]

# [{"table"=>
#    {"tag"=>"3476",
#     "title"=>"24th St & Mission St",
#     "lat"=>"37.7523199",
#     "lon"=>"-122.41833",
#     "stopId"=>"37.7523199",
#     "route_tag"=>"12",
#     "direction"=>"12_IB1"},
#   "modifiable"=>true},
#  {"table"=>
#    {"tag"=>"6877",
#     "title"=>"Valencia St & 24th St",
#     "lat"=>"37.75186",
#     "lon"=>"-122.4207399",
#     "stopId"=>"37.75186",
#     "route_tag"=>"12",
#     "direction"=>"12_IB1"},
#   "modifiable"=>true}]


