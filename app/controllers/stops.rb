get '/:direction/:route_number/:title' do
  # @route_number = params[:route_number]
  # @title = params[:title]
  # r = Muni::Route.find(@route_number)
  # @stop = r.inbound.stop_at(@title)
  get_stop_data
  erb :'stops/show'
end

# get '/:direction/:route_number/:title' do
#   get_stop_data
#   erb :'stops/show'
# end
