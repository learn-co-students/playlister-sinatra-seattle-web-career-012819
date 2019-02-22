class SongsController < ApplicationController

  get '/songs/new' do 
    @songs = Song.all 
    @artists = Artist.all 
    @genres = Genre.all 
    erb :'songs/new'
  end 

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @artist = @song.artist
    erb :'songs/show'
  end
  
  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  post '/songs' do 
    binding.pry
    @song = Song.create(params)
    @slug = @song.slug
    redirect '/songs/@slug'
  end 

end
