class GenresController < ApplicationController

   get '/genres' do
     @genre_list = Genre.all
      erb :'genres/index'
   end

   get '/genres/:name' do
      erb :show
   end

end
