class ArtistsController < ApplicationController
  set :views, Proc.new { File.join(root, "../views/artist/") }


  get '/artist' do

  end

  get '/artist/:id' do

  end
end
