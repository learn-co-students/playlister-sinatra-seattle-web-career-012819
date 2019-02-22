class SongsController < ApplicationController
    set :views, 'app/views/songs/'

    get '/songs' do
        @songs = Song.all
        erb :index
    end

    get '/songs/:slug' do
        requested_song = Song.find_by_slug(params['slug'])
        @song_name = requested_song.name
        #run slug logic
        erb :show
    end
end