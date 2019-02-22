class ArtistsController < ApplicationController
    set :views, 'app/views/artists/'

    get '/artists' do
        @artists = Artist.all
        erb :index
    end

    get '/artists/:slug' do
        requested_artist = Artist.find_by_slug(params['slug'])
        @artist_name = requested_artist.name
        #run slug logic
        erb :show
    end
end
