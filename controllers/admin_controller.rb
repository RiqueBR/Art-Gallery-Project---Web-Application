require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/artist')
require_relative('../models/exhibition')
also_reload('../models/*')

get '/admin/artist' do
  @artists = Artist.find_all()
  erb(:"admin/index")
end

get '/admin/exhibition' do
  @exhibitions = Exhibition.find_all()
  erb(:"admin/index")
end

## Remember to create a folder with artist views and exhibitions views
## Also, visitor will have a different layout look in comparison to admin

get 'admin/artist/:id' do
  @artist = Artist.find_id(params['id'].to_i)
end

get 'admin/exhibition/:id' do
  @exhibition = Exhibition.find_id(params['id'].to_i)
end
