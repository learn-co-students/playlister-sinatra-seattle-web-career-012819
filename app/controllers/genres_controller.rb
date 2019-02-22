class GenresController < ApplicationController
    set :views, 'app/views/genres/'

    get '/genres' do
        @genres = Genre.all
        erb :index
    end

    get '/genres/:slug' do
        requested_genre = Genre.find_by_slug(params['slug'])
        @genre_name = requested_genre.name
        #run slug logic
        erb :show
    end
end