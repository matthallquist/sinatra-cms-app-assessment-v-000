class RecipesController < ApplicationController

  get '/recipes' do
    @recipes = Recipe.all
    erb :'/recipes/recipes'
  end

  get '/recipes/new' do
    erb :'/recipes/new'
  end

  post '/recipes' do
    if params[:name] == "" || params[:category] == "" || params[:prep_time] == "" || params[:cook_time] == "" || params[:ingredients] == "" || params[:instructions] == ""
      redirect to '/recipes/new'
    else
      @recipe = Recipe.create(name: params[:name], category: params[:category], prep_time: params[:prep_time], cook_time: params[:cook_time], ingredients: params[:ingredients], instructions: params[:instructions])
      @recipe.save
      redirect to '/recipes'
    end
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
