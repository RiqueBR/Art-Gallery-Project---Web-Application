require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/artist')
require_relative('../models/exhibition')
also_reload('../models/*')

get '/artist' do
  @artists = Artist.find_all()
  erb(:"artist/index")
end

get '/exhibition' do
  @exhibitions = Exhibition.find_all()
  erb(:"exhibition/index")
end

get '/artist/new' do
  erb(:"artist/new")
end

get '/artist/:id' do
  @artist = Artist.find_id(params['id'].to_i)
  erb(:"artist/show")
end


post '/artist' do
  @artist = Artist.new(params)
  @artist.save()
  erb(:"artist/new")
end

get '/exhibition/new' do
  erb(:"exhibition/new")
end

post '/exhibition' do
  @exhibition = Exhibition.new(params)
  @exhibition.save()
  erb(:"exhibition/new")
end

get '/artist/:id/edit' do
  @artist = Artist.find_id(params['id'])
  erb(:"artist/edit")
end

post '/artist/:id' do
  @artist = Artist.new(params)
  @artist.update()
  redirect '/artist'
end
