class UsersController < ApplicationController

  get '/signup' do
    if logged_in
      redirect to '/recipes'
    else
      erb :'/users/signup'
    end
  end

  post '/signup' do

  end

  get '/login' do

  end

  post '/login' do

  end

  get '/logout' do

  end

  get '/users/:id' do

  end
end
