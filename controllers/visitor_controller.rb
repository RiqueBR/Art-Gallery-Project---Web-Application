require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/artist')
require_relative('../models/exhibition')
also_reload('../models/*')

get '/artist' do
  
end
