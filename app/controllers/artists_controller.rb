class ArtistsController < ApplicationController
    set :views, 'app/views/artists/'

    get '/artists' do
        @artists = Artist.all
        erb :index
    end

    get '/artists/:slug' do
        @requested_artist = Artist.find_by_slug(params['slug'])
        @artists_songs = @requested_artist.songs
        @artists_genres = @requested_artist.genres
        
        erb :show
    end
end
