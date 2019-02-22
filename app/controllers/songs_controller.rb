class SongsController < ApplicationController

  get '/songs/new' do 
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
    @song = Song.create(params)
    @slug = @song.slug
    redirect '/songs/@slug'
  end 

  get '/songs/:slug/edit' do
    erb :'songs/edit'
  end

  patch '/songs/:slug/edit' do

    redirect '/songs/show'
  end

end
