get '/:direction/:route_number/:title' do
  get_stop_data
  erb :'stops/show'
end
