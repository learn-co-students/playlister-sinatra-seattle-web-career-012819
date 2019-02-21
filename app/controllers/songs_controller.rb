class SongsController < ApplicationController
  # set :views, '../views/songs'

  get "/songs" do
    @songs = Song.all
    erb :"songs/index"
  end

  get "/songs/new" do
    @genres = Genre.all
    erb :"songs/new"
  end

  post "/songs/new" do
    artist = Artist.find_or_create_by(name: params[:artist])
    song = Song.create(name: params[:name], artist_id: artist.id)
    #get genres
    genre = params[:dance]
    binding.pry
    #SongGenre.create(song_id: song.id, genre_id: )
    #redirect "songs/:id"
  end

  get "/songs/:id" do
    @song = Song.find(params[:id])
    @genres = @song.genres
    erb :"songs/show"
  end


end
