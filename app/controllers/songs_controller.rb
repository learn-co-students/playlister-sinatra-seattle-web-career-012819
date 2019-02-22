class SongsController < ApplicationController
  # set :views, '../views/songs'

  get "/songs" do
    # @slug_name = Slugifiable.slug(params[:slug])
    # @deslugged = Slugifiable.find_by_slug(string)
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
    genre_params = params.reject {|k,v| k == "name" || k == "artist"}
    genre_params.each do |k,v|
      genre = Genre.find_by(name: k)
      SongGenre.create(song_id: song.id, genre_id: genre.id)
    end
    redirect "/songs"
  end

  get "/songs/:slug" do
    # string = Slugifiable.slug(params[:slug])
    deslugged = Slugifiable.find_by_slug(params[:slug])
    # binding.pry
    @song = Song.find_by(name: deslugged)
    @genres = @song.genres
    erb :"songs/show"
  end

  get "/songs/:slug/edit" do
    deslugged = Slugifiable.find_by_slug(params[:slug])
    @song = Song.find_by(name: deslugged)
    @genres = Genre.all
    @song_genre = @song.genres
    @artist = @song.artist
    erb :"songs/edit"
  end

  patch "/songs/:slug/edit" do
    song = Song.find_by(id: params[:id])
    artist = Artist.find_or_create_by(name: params[:artist])
    unneccessary_params = ["name", "artist", "_method", "id", "slug"]
    genre_params = params.reject {|k,v| unneccessary_params.include? k}
    songgenres = SongGenre.all
    songgenres.each do |ids|
      if ids.song_id == song.id
        ids.delete
      end
    end
    genre_params.each do |k,v|
      genre = Genre.find_by(name: k)
      SongGenre.create(song_id: song.id, genre_id: genre.id)
    end
    song.update(name: params[:name], artist_id: artist.id)
    slug_name = Slugifiable.slug(params[:slug])
    redirect "/songs/#{slug_name}"
  end

end
