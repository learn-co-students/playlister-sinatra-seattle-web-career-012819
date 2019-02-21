class GenresController < ApplicationController
  set :views, Proc.new { File.join(root, "../views/genre/") }

  get '/genres' do
    @genres = Genre.all
    erb :index
  end

  get '/genres/:id' do
    @genre = Genre.find(params[:id])
    erb :show
  end
end
