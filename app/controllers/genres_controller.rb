class GenresController < ApplicationController
  set :views, Proc.new { File.join(root, "../views/genre/") }

  get '/genres' do
    @genres = Genre.all
    erb :index
  end

  get '/genres/:slug' do
    @genre = Genre.find_by_slug(params[:slug])
    erb :show
  end
end
