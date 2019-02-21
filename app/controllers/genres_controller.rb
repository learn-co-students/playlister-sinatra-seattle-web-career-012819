class GenresController < ApplicationController
   #
   get '/genres' do 
      erb :index 
   end 

   get '/genres/:name' do 
      erb :show 
   end 

end
