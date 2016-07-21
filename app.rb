require "bundler/setup"
require "pry"
Bundler.require :default
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get '/' do
  erb :index
end

get '/recipes' do
  @recipes = Recipe.all
  erb :recipes
end

get '/tags' do
  @tags = Tag.all
  erb :tags
end

post '/tags/new'  do
  category = params["category"]
  tag = Tag.create({category: category})
  redirect '/tags'
end

post '/recipes/new'  do
  name = params["name"]
  ingredients = params["ingredients"].split(", ")
  instructions = params["instructions"]
  @recipe = Recipe.create({name: name, instructions: instructions})
  ingredients.each { |ingredient|
    new_ingredient = Ingredient.create({name: ingredient})
    @recipe.ingredients.push(new_ingredient)
  }
  @ingredients = Ingredient.all
  redirect '/recipes'
end

get'/recipes/:id' do
  @recipe = Recipe.find(params["id"].to_i)
  @tags = Tag.all
  @ingredients = Ingredient.all
  erb :recipe
end

get '/tags/:id'  do
  @tag = Tag.find(params["id"].to_i)
  @recipes = Recipe.all
  erb :tag
end

post '/recipes/:id/tag'  do
  recipe_id = params["recipe_id"].to_i
  tag_id = params["tag_id"].to_i
  tag = Tag.find(tag_id)
  @recipe = Recipe.find(recipe_id)
  @recipe.tags.push(tag)
  @ingredients = Ingredient.all
  redirect "/recipes/#{@recipe.id}"
end

post '/recipes/:id/tag/new'  do
  @recipe = Recipe.find(params["id"].to_i)
  category = params["category"]
  tag = Tag.create({category: category})
  @recipe.tags.push(tag)
  @ingredients = Ingredient.all
  redirect "/recipes/#{@recipe.id}"
end

delete"/recipes/:id" do
  @recipe = Recipe.find(params['id'].to_i)
  @recipe.delete
  @recipes = Recipe.all
  @tags = Tag.all
  @tags.each { |tag| tag.recipes.destroy(@recipe) }
  redirect '/recipes'
end

delete "/tags/:id" do
  @tag = Tag.find(params['id'].to_i)
  @tag.delete
  @tags = Tag.all
  @recipes = Recipe.all
  @recipes.each { |recipe| recipe.tags.destroy(@tag) }
  redirect '/tags'
end

patch '/recipes/:id' do
  @recipe = Recipe.find(params["id"].to_i)
  name = params['new_name']
  @recipe.update({name: name})
  @tags = Tag.all
  @ingredients = Ingredient.all
  erb :recipe
end

patch '/tags/:id' do
  @tag = Tag.find(params['id'].to_i)
  category = params['new_category']
  @tag.update({category: category})
  @recipes = Recipe.all
  erb :tag
end

post '/recipes/:id/rate' do
  @recipe = Recipe.find(params["id"].to_i)
  rating = params["rating"].to_i
  @recipe.update({rating: rating})
  @tags = Tag.all
  @ingredients = Ingredient.all
  redirect "/recipes/#{@recipe.id}"
end

get '/ratings' do
  @recipes = Recipe.all
  erb :ratings
end

get '/ingredients' do
  @ingredients = Ingredient.all
  erb :ingredients
end

get '/ingredients/:id' do
  @ingredient = Ingredient.find(params["id"].to_i)
  @recipes = Recipe.all
  erb :ingredient
end

delete("/ingredients/:id") do
  @ingredient = Ingredient.find(params["id"].to_i)
  @ingredient.delete
  @ingredients = Ingredient.all
  @recipes = Recipe.all
  @recipes.each { |recipe| recipe.ingredients.destroy(@ingredient) }
  redirect '/ingredients'
end

patch '/ingredients/:id' do
  @ingredient = Ingredient.find(params["id"].to_i)
  name = params['new_name']
  @ingredient.update({name: name})
  erb :ingredient
end
