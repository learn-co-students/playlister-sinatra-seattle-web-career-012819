class GenresController < ApplicationController
  # set :views, 'app/views/genres'

  get '/genres' do
    @genres = Genre.all
    erb :'genres/index'
  end

  get '/genres/:slug' do
    slug = params[:slug]
    @genre = Genre.find_by_slug(slug)
    erb :'genres/show'
  end

end
