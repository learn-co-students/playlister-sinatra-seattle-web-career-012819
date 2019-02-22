class SongsController < ApplicationController
    set :views, 'app/views/songs/'

    get '/songs' do
        @songs = Song.all
        erb :index
    end

    get '/songs/new' do
        erb :new
    end

    post '/songs/' do
        @song = Song.new(:name => params['Name'])
        @song.artist = Artist.find_or_create_by(:name => params['Artist Name'])
        @song.genre_ids = params[:genres]
        @song.save

        redirect "/songs/#{@song.slug}"
    end

    get '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
    
        erb :show
    end

end