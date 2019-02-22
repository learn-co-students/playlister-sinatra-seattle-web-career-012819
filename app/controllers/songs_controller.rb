class SongController < ApplicationController
  set :views, "app/views/songs"

  get '/songs' do
    @songs = Song.all
    # binding.pry
    erb :index
  end #end of get '/songs' path

  get '/songs/new' do
    erb :new
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :show
  end


end #end of SongController class
