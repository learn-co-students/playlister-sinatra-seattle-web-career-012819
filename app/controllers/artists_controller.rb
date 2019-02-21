class ArtistsController < ApplicationController

  get '/artists' do
    @artist_list = Artist.all
    erb :'artists/index'
  end

  get '/artists/:slug' do
    @artist = Artist.find_by_slug(params[:slug])
    erb :show
  end


end

# it "displays a list of artists" do
#   expect(page).to have_content(artist_name)
# end
#
# it "contains links to each artist's show page" do
#   expect(page).to have_css("a[href='/artists/#{@artist.slug}']")
# end
# end
