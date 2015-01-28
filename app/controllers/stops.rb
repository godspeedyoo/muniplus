get '/stops/:tag' do
  @stop = Stop.find_by(:tag, params[:tag])
  erb :'stops/show'
end
