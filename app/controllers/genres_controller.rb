class GenresController < ApplicationController
  get "/genres" do
    # @slug_name = Slugifiable.slug(params[:slug])
    # @deslugged = Slugifiable.find_by_slug(string)
    @genres = Genre.all
    erb :"genres/index"
  end

  get "/genres/:slug" do
    # string = Slugifiable.slug(params[:slug])
    @genre = Genre.find_by_slug(params[:slug])
    #binding.pry
    @songs = @genre.songs
    @artists = []
    @songs.each do |song|
      @artists << song.artist
    end
    @artists = @artists.flatten.uniq
    erb :"genres/show"
  end
end
