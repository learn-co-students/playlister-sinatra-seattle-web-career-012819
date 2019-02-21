class SongsController < ApplicationController
  set :views, Proc.new { File.join(root, "../views/song/") }

  get '/songs' do
    @songs = Song.all
    erb :index
  end

  get 'songs/new' do
    erb :new
  end

  get '/songs/:id' do
    @song = Song.find(params[:id])
    erb :show
  end
end
