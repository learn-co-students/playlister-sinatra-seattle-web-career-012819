class SongsController < ApplicationController

    get '/songs' do
        @songs =Song.all
        erb :'songs/index'
    end

    get '/songs/new' do
        @artists = Artist.all
        erb :'songs/new'
    end

    post '/songs' do
        @song = Song.find_or_create_by(name: params[:song_name])
        @song.genre_ids = params[:genre]
        @song.artist = Artist.find_or_create_by(name: params[:artist_name])
        @song.save
        # binding.pry
        redirect to "/songs/#{@song.slug}"
    end

    get '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
        erb :'songs/show'
    end

    get '/songs/:slug/edit' do
        @song = Song.find_by_slug(params[:slug])
        erb :'songs/edit'
    end

    patch '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
        @song.genre_id = params[:genre_id]
        @song.artist = Artist.find_or_create_by(name: params[:artist_name])
        @song.update(params[:song])
        redirect to "/songs/#{@song.slug}"
    end

end
