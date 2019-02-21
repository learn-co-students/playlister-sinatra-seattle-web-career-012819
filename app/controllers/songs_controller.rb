class SongsController < ApplicationController

    get '/song' do
        @songs = Song.all
        erb :index
    end
end