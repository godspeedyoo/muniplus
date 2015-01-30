get '/:direction/:route_number/:title' do
  get_stop_data
  erb :'stops/show'
end

get '/p/:direction/:route_number/:title' do
  get_stop_data
  prediction_data = {}
  @stop.predictions.each_with_index do |prediction, index|
    prediction_data[index] = prediction.seconds
  end
  prediction_data.to_json
end
