class SongsController < ApplicationController
  set :views, Proc.new { File.join(root, "../views/song/") }

  get '/songs' do
    @songs = Song.all
    erb :index
  end

  get '/songs/new' do
    @genres = Genre.all
    erb :new
  end

  get '/songs/:id' do
    @song = Song.find(params[:id])
    erb :show
  end

  post '/songs' do
    @new_song = Song.create(name: params[:song_name])
    @new_song.artist = Artist.find_or_create_by(name: params[:artist_name])
    @new_song.genres = params[:genres].map { |elmt| Genre.find(elmt.to_i) }
    @new_song.save
    redirect "/songs/#{@new_song.id}"
  end
end
