class GenreController < ApplicationController
  set :views, "app/views/genres"

  get '/genres' do
    @genres = Genre.all
    # binding.pry
    erb :index
  end #end of get '/genres' path

  get '/genres/:slug' do
    @genre = Genre.find_by_slug(params[:slug])
    erb :show
  end

end #end of SongController class
