require 'rack-flash'
require 'pry'
class SongsController < ApplicationController
  set :views, 'app/views/songs'
  use Rack::Flash

  # Read
  get '/songs' do
    # binding.pry
    @songs = Song.all

    erb :index
  end

  # Create
  get '/songs/new' do
    erb :new 
  end

  post '/songs' do
    song = Song.create(name: params[:song][:name])
    artist = Artist.find_or_create_by(name: params[:song][:artist][:name])
    song.artist = artist
    
    params[:song][:genres].each do |id|
      genre = Genre.find(id)
      song.song_genres.build(genre: genre)
    end
    song.save

    # binding.pry
    flash[:message] = "Successfully created song."
    redirect "/songs/#{ song.slug }"
  end
  
  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug]) 

    erb :show
  end

  

  # Update
  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug]) 
    erb :edit
  end

  patch '/songs/:slug' do
    song = Song.find_by_slug(params[:slug])
    # song_params = params.reject{|k,v| k == '_method'}
    # binding.pry
    # song.update(song_params)
    song.update(name: params[:song][:name])
    artist = Artist.find_or_create_by(name: params[:song][:artist][:name])
    song.artist = artist
    
    params[:song][:genres].each do |id|
      genre = Genre.find(id)
      song.song_genres.build(genre: genre)
    end
    song.save

    # binding.pry
    flash[:message] = "Successfully updated song."
    redirect "/songs/#{params[:slug]}"
  end

  # Delete
  delete '/songs/:slug' do

    redirect '/songs'
  end

end