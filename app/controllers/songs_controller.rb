class SongsController < ApplicationController
 use Rack::Flash



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
    @artist = Artist.find_or_create_by(name: params[:song][:artist_name])
    song_name = params[:song][:name]
    song_hash = {}
    song_hash[:artist_id] = @artist.id
    song_hash[:name] = song_name
    @song = Song.create(song_hash)
    params[:song][:genres].each do |element|
      @genre = Genre.find_by(id: element[:name])
      @song.genres << @genre
      @song.save
    end
    @song.save
    flash[:message] = "Successfully created song."
    redirect "/songs/#{@song.slug}"
  end

  get '/songs/:slug/edit' do
    @genres = Genre.all 
    @songs = Song.all 
    @artists = Artist.all
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/edit'
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @artist = Artist.find_or_create_by(name: params[:artist_name])
    @song.artist = @artist
    @song.genres.clear
    @song.save
    params[:genres].each do |element|
      @genre = Genre.find_by(id: element[:name])
      @song.genres << @genre
      @song.save
    end
    flash[:message] = "Successfully updated song."
    redirect to ("/songs/#{@song.slug}")
  end

end
