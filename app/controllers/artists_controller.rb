class ArtistController < ApplicationController
  set :views, "app/views/artists"

  get '/artists' do
    @artists = Artist.all
    # binding.pry
    erb :index
  end #end of get '/artists' path

  get '/artists/:slug' do
    @artist = Artist.find_by_slug(params[:slug])
    erb :show
  end


end #end of SongController class
