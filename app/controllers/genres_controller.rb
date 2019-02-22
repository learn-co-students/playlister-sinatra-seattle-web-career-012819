class GenresController < ApplicationController
    set :views, 'app/views/genres/'

    get '/genres' do
        @genres = Genre.all
        erb :index
    end

    get '/genres/:slug' do
        erb :show
    end
end