class ArtistsController < ApplicationController
  set :views, Proc.new { File.join(root, "../views/artist/") }


  get '/artists' do
    @artists = Artist.all
    erb :index
  end

  get '/artists/:id' do
    @artist = Artist.find(params[:id])
    erb :show
  end
end
