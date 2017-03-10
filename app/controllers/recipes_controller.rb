class RecipesController < ApplicationController

  get '/recipes' do
    @recipes = Recipe.all
    erb :'/recipes/recipes'
  end

  get '/recipes/new' do
    erb :'/recipes/new'
  end

  post '/recipes' do

  end

  get '/recipes/:id' do
    @recipe = Recipe.find_by(:id => params[:id])
    erb :'/recipes/show'
  end

  get '/recipes/:id/edit' do
    @recipe = Recipe.find_by(:id => params[:id])
    erb :'/recipes/edit'
  end

  patch '/recipes/:id' do

  end

  delete '/recipes/:id/delete' do

  end


end
