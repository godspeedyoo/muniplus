helpers do

  Stop = Struct.new(:data) do
    def stop(attr)
      self.data["table"][attr]
    end
  end

  def get_stop_data
    @direction = params[:direction].to_sym
    @route_number = params[:route_number]
    @title = params[:title]
    find_route
    find_stop
  end

  def find_route
    @route = Muni::Route.find(@route_number)
  end

  def find_stop
    @stop = @route.send(@direction).stop_at(@title)
  end


end
