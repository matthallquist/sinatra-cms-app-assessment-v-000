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
      @recipe = Recipe.new
      erb :'/recipes/new'
    else
      redirect to '/login'
    end
  end

  post '/recipes' do
    @recipe = Recipe.create(photo: params[:photo_url], name: params[:name], category: params[:category], prep_time: params[:prep_time], cook_time: params[:cook_time], ingredients: params[:ingredients], instructions: params[:instructions])
    if @recipe.valid?
      @recipe.user = current_user
      @recipe.user.recipes << @recipe
      @recipe.save
      redirect to '/recipes'
    else
      erb :'/recipes/new'
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
    @recipe = Recipe.find_by(:id => params[:id])
    @recipe.name = params[:name]
    @recipe.category = params[:category]
    @recipe.prep_time = params[:prep_time]
    @recipe.cook_time = params[:cook_time]
    @recipe.ingredients = params[:ingredients]
    @recipe.instructions = params[:instructions]
    if @recipe.valid?
      @recipe.save
      redirect to "/recipes/#{@recipe.id}"
    else
      erb :'/recipes/edit'
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

  get '/recipes/:id/review' do
    @recipe = Recipe.find_by(:id => params[:id])
    if logged_in
      if @recipe.user_id != current_user.id
        erb :'/reviews/new'
      else
        redirect to "/recipes/#{ @recipe.id }"
      end
    else
      redirect to '/login'
    end
  end

  post '/recipes/:id/review' do
    @recipe = Recipe.find_by(:id => params[:id])
    @review = Review.create(rating: params[:rating], content: params[:content])
    if @review.valid?
      @review.recipe = @recipe
      @recipe.reviews << @review
      @review.user_id = current_user.id
      current_user.reviews << @review
      @review.save
      redirect to "/recipes/#{ @recipe.id }"
    else
      redirect to "/recipes/#{ @recipe.id }/review"
    end
  end

  delete '/recipes/:id/review/:id_two/delete' do
    @review = Review.find_by(:id => params[:id_two])
    if @review.user_id == current_user.id
      @review.delete
      redirect to '/recipes'
    else
      redirect to "/recipes/#{@recipe.id}"
    end
  end

end
