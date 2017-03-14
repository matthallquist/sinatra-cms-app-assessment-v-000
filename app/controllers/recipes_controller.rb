class RecipesController < ApplicationController

  get '/recipes' do
    @recipes = Recipe.all
    if logged_in
      erb :'/recipes/recipes'
    else
      redirect to '/login'
    end
  end

  get '/recipes/new' do
    if logged_in
      erb :'/recipes/new'
    else
      redirect to '/login'
    end
  end

  post '/recipes' do
    @recipe = Recipe.create(name: params[:name], category: params[:category], prep_time: params[:prep_time], cook_time: params[:cook_time], ingredients: params[:ingredients], instructions: params[:instructions])
    if @recipe.valid?
      @recipe.user = current_user
      @recipe.user.recipes << @recipe
      @recipe.save
      redirect to '/recipes'
    else
      redirect to '/recipes/new'
    end
  end

  get '/recipes/:id' do
    if logged_in
      @recipe = Recipe.find_by(:id => params[:id])
      erb :'/recipes/show'
    else
      redirect to '/login'
    end
  end

  get '/recipes/:id/edit' do
    if logged_in
      @recipe = Recipe.find_by(:id => params[:id])
      if @recipe.user_id == current_user.id
        erb :'/recipes/edit'
      else
        redirect to "/recipes/#{ @recipe.id }"
      end
    else
      redirect to '/login'
    end
  end

  patch '/recipes/:id' do
    if params[:name] == "" || params[:category] == "" || params[:prep_time] == "" || params[:cook_time] == "" || params[:ingredients] == "" || params[:instructions] == ""
      redirect to "/recipes/#{params[:id]}/edit"
    else
      @recipe = Recipe.find_by(:id => params[:id])
      @recipe.name = params[:name]
      @recipe.category = params[:category]
      @recipe.prep_time = params[:prep_time]
      @recipe.cook_time = params[:cook_time]
      @recipe.ingredients = params[:ingredients]
      @recipe.instructions = params[:instructions]
      @recipe.save
      redirect to "/recipes/#{@recipe.id}"
    end
  end

  delete '/recipes/:id/delete' do
    @recipe = Recipe.find_by(:id => params[:id])
    if @recipe.user_id == current_user.id
      @recipe.delete
      redirect to '/recipes'
    else
      redirect to "/recipes/#{@recipe.id}"
    end
  end


end
