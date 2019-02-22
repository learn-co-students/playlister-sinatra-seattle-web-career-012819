class ArtistsController < ApplicationController
  get "/artists" do
    # @slug_name = Slugifiable.slug(params[:slug])
    # @deslugged = Slugifiable.find_by_slug(string)
    @artists = Artist.all
    erb :"artists/index"
  end

  get "/artists/:slug" do
    # string = Slugifiable.slug(params[:slug])
    @artist = Artist.find_by_slug(params[:slug])
    #binding.pry
    @songs = @artist.songs
    @genres = []
    @songs.each do |song|
      @genres << song.genres
    end
    @genres = @genres.flatten.uniq
    erb :"artists/show"
  end

end
