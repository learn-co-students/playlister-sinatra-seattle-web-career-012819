class SongController < ApplicationController
  set :views, "app/views/songs"

  get '/songs' do
    @songs = Song.all
    # binding.pry
    erb :index
  end #end of get '/songs' path

  get '/songs/new' do
    @genres = Genre.all
    erb :new
  end

  post '/songs/create' do
    artist = Artist.find_or_create_by(name: params["Artist Name"])
    song = Song.create(name: params[:Name], artist_id: artist.id)
    genres = params.keys.select { |genre| params[genre]=="on" }
    genres.map! { |genre| Genre.find_by(name: genre) }
    genres.each { |genre| SongGenre.create(song_id: song.id, genre_id: genre.id) }
    redirect "/songs/#{song.slug}"
    #binding.pry
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :show
  end


end #end of SongController class
