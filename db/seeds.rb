# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "json"
require "open-uri"

json = open("https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list").read
data = JSON.parse(json)

Ingredient.destroy_all
Cocktail.destroy_all
Dose.destroy_all

data["drinks"].each do |ingredient|
  Ingredient.create(name: ingredient["strIngredient1"])
end

whiteRussian = Cocktail.create(name: "White Russian")
Cocktail.create(name: "Mojito")
Cocktail.create(name: "Caïpirowska")

Dose.create(description: "a little bit", cocktail_id: whiteRussian.id, ingredient_id: Ingredient.first.id)