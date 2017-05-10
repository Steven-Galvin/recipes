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
