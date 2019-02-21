class GenresController < ApplicationController

    get '/genre' do
        @genres = Genre.all
        erb :index
    end
end