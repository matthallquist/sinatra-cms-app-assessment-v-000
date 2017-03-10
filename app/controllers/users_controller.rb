class UsersController < ApplicationController

  get '/signup' do
    if logged_in
      redirect to '/recipes'
    else
      erb :'/users/signup'
    end
  end

  post '/signup' do
    if params[:password] == "" || params[:email] == "" || params[:username] == ""
      redirect to '/signup'
    else
      if User.find_by(:username => params[:username])
        #need error here 'username exists'
        redirect to '/signup'
      else
        @user = User.create(:username => params[:username], :password => params[:password])
        @user.save
        session[:user_id] = @user.id
        redirect to '/recipes'
      end
    end
  end

  get '/login' do
    if logged_in
      redirect to '/recipes'
    else
      erb :'/users/login'
    end
  end

  post '/login' do
    @user = User.find_by(:username => params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect to '/recipes'
    else
      redirect to '/signup'
    end
  end

  get '/logout' do
    if logged_in
      session.destroy
      redirect to '/login'
    else
      redirect to '/'
    end
  end

  get '/users/:id' do

  end
end
