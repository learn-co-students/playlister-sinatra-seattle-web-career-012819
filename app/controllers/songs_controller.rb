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
    song = Song.find_or_create_by(name: params[:Name], artist_id: artist.id)
    genres = params.keys.select { |genre| params[genre]=="on" }
    genres.map! { |genre| Genre.find_by(name: genre) }
    genres.each { |genre| SongGenre.create(song_id: song.id, genre_id: genre.id) }
    redirect "/songs/#{song.slug}?new=yes"
    #binding.pry
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @is_new = params["new"]
    @was_updated = params["updated"]
    erb :show
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @genres = Genre.all
    erb :edit
  end

  patch '/songs/:slug' do 
    song = Song.find_by(id: params["Song Id"])
    artist = Artist.find_or_create_by(name: params["Artist Name"])
    song.update(artist_id: artist.id )
    redirect "/songs/#{song.slug}?updated=yes"
  end


end #end of SongController class
