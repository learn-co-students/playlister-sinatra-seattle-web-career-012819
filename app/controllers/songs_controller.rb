class SongsController < ApplicationController

    get '/song' do
        @songs = Song.all
        
    end
end