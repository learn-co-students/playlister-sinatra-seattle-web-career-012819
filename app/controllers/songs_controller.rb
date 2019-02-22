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
    #flash[:message] = "Successfully created song."
    redirect "/songs/#{song.slug}"
  end

  get "/songs/:slug" do
    # string = Slugifiable.slug(params[:slug])
    @song = Song.find_by_slug(params[:slug])
    @genres = @song.genres
    erb :"songs/show"
  end

  get "/songs/:slug/edit" do
    deslugged = Song.find_by_slug(params[:slug])
    @song = deslugged
    @genres = Genre.all
    @song_genre = @song.genres
    @artist = @song.artist
    erb :"songs/edit"
  end

  patch "/songs/:slug" do
    song = Song.find_by(id: params[:id])
    artist = Artist.find_or_create_by(name: params[:artist])
    unneccessary_params = ["name", "Name", "artist", "_method", "id", "slug"]
    genre_params = params.reject {|k,v| unneccessary_params.include? k}
    songgenres = SongGenre.all
    songgenres.each do |ids|
      if ids.song_id == song.id
        ids.delete
        ids.save
      end
    end
    genre_params.each do |k,v|
      genre = Genre.find_by(name: k)

      songGenre = SongGenre.create(song_id: song.id, genre_id: genre.id)
    end
    song_params = {"name" => params[:name], "artist_id" => artist.id}
    song.update(song_params)
    #update doesnt work

    slug_name = song.slug()
    #flash[:message] = "Successfully created song."
    redirect "/songs/#{slug_name}"
  end

end
