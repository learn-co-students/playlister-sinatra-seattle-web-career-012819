class ArtistsController < ApplicationController

    get '/artist' do
        @artists = Artist.all
        
    end
end
