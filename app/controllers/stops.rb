get '/inbound/:route_number/:title' do
  # Implement a muni:route: find stop by using the string given in the stop title
  # @stop = Stop.find_by(:tag, params[:tag])
  #   @stop = find_stop_by_tag(params, @route)

  @route_number = params[:route_number]
  @title = params[:title]
  r = Muni::Route.find(@route_number)

  @stop = r.inbound.stop_at(@title)
  # @stop.predictions
  binding.pry

  erb :'stops/show'
end

get '/outbound/:route_number/:title' do
end
