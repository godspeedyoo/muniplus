get '/stops/:tag' do
  # Implement a muni:route: find stop by using the string given in the stop title
  # @stop = Stop.find_by(:tag, params[:tag])
  #   @stop = find_stop_by_tag(params, @route)
  erb :'stops/show'
end
