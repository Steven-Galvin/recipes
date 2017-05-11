require "bundler/setup"
Bundler.require :default
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get "/" do
  erb :index
end

# CATEGORY PATH

get "/categories" do
  @categories = Category.all
  erb :categories
end

get "/categories/add" do
  @categories = Category.all
  erb :add_categories
end

post "/categories/add" do
  category_name = params["category_name"]
  @category = Category.create({:name => category_name})
  redirect "/categories/add"
end

get "/categories/:id" do
  @category = Category.find(params['id'].to_i)
  erb :category
end

get "/categories/:id/add_recipes" do
  @category = Category.find(params['id'].to_i)
  @recipes = Recipe.all
  erb :add_recipes_to_category
end

patch "/categories/:id" do
  category_id = params['id'].to_i
  @category = Category.find(category_id)
  current_ids = @category.recipes.map(&:id) ##(&:id) = {|e| e.id}

  recipe_ids = params['recipe_ids']
  all_recipes = current_ids + recipe_ids
  @category.update({:recipe_ids => all_recipes})
  redirect "/categories/#{category_id}"
end

# INGREDIENT PATH

get "/ingredients" do
  @ingredients = Ingredient.all
  erb :ingredients
end

get "/ingredients/add" do
  @ingredients = Ingredient.all
  erb :add_ingredients
end

post "/ingredients/add" do
  ingredient_name = params["ingredient_name"]
  @ingredient = Ingredient.create({:name => ingredient_name})
  redirect "/ingredients/add"
end

# RECIPE PATH

get "/recipes" do
  @recipes = Recipe.all
  erb :recipes
end

get "/recipes/add" do
  @recipes = Recipe.all
  erb :add_recipes
end

post "/recipes/add" do
  recipe_name = params["recipe_name"]
  recipe_description = params["description"]
  @recipe = Recipe.create({:name => recipe_name, :description => recipe_description})
  redirect "/recipes/add"
end

get "/recipes/:id" do
  @recipe = Recipe.find(params['id'].to_i)
  erb :recipe
end

get '/recipes/:id/add_categories' do
  @recipe = Recipe.find(params['id'].to_i)
  @categories = Category.all
  erb :add_categories_to_recipes
end

patch "/recipes/:id" do
  recipe_id = params['id'].to_i
  @recipe = Recipe.find(recipe_id)
  current_ids = @recipe.categories.map(&:id) ##(&:id) = {|e| e.id}
  category_ids = params['category_ids']
  all_categories = current_ids + category_ids
  @recipe.update({:category_ids => all_categories})
  redirect "/recipes/#{recipe_id}"
end
