get '/' do
  p Muni::Route.find(:all)
  200
end
