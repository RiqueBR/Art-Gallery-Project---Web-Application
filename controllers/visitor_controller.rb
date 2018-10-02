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
  @artists = Artist.find_all
  @exhibitions = Exhibition.find_all()
  erb(:"exhibition/index")
end

get '/exhibition/filter' do
  @artists = Artist.exhibitions(params['first_name'])
end

post '/exhibition/filter' do
  artist = Artist.find_id(params['artist_id'])
  @exhibitions = artist.exhibitions
  erb(:"exhibition/filter_by_artist")
end


get '/exhibition/:id' do
  @exhibition = Exhibition.find_id(params['id'])
  erb(:"exhibition/show")
end

get '/artist/:id' do
  @artist = Artist.find_id(params['id'])
  erb(:"artist/show")
end



# get '/artist/new' do
#   erb(:"artist/new")
# end
#

# post '/artist' do
#   @artist = Artist.new(params)
#   @artist.save()
#   redirect '/artist'
# end
#
# get '/exhibition/new' do
#   @artists = Artist.find_all
#   erb(:"exhibition/new")
# end
#
# post '/exhibition' do
#   @exhibition = Exhibition.new(params)
#   @exhibition.save()
#   redirect '/exhibition'
# end
#
# get '/artist/:id/edit' do
#   @artist = Artist.find_id(params['id'])
#   erb(:"artist/edit")
# end
#
# post '/artist/:id' do
#   @artist = Artist.new(params)
#   @artist.update()
#   redirect '/artist'
# end
#
# post '/artist/:id/delete' do
#   Artist.delete(params[:id])
#   redirect '/artist'
# end
#

#
# get '/exhibition/:id/edit' do
#   @artists = Artist.find_all()
#   @exhibition  = Exhibition.find_id(params['id'])
#   erb(:"exhibition/edit")
# end
#
# post '/exhibition/:id' do
#   @exhibition = Exhibition.new(params)
#   @exhibition.update()
#   redirect '/exhibition'
# end
#
# post '/exhibition/:id/delete' do
#   @artists = Artist.find_all
#   Exhibition.delete(params[:id])
#   redirect '/exhibition'
# end
