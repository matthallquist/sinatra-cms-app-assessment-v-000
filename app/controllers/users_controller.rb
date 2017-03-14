class UsersController < ApplicationController

  get '/signup' do
    @user = User.new
    if logged_in
      redirect to '/recipes'
    else
      erb :'/users/signup'
    end
  end

  post '/signup' do
    @user = User.create(:username => params[:username], :password => params[:password])
    if @user.valid?
      @user.save
      session[:user_id] = @user.id
      current_user
      redirect to '/recipes'
    else
      erb :'/users/signup'
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
      current_user
      redirect to '/recipes'
    else
      erb :'/users/login'
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
    @user = User.find_by(:id => params[:id])
    erb :'/users/show'
  end
end
