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


Cocktail.destroy_all
Dose.destroy_all
Ingredient.destroy_all

data["drinks"].each do |ingredient|
  Ingredient.create(name: ingredient["strIngredient1"])
end

whiteRussian = Cocktail.create(name: "White Russian", image: "https://images.unsplash.com/photo-1470337458703-46ad1756a187?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1049&q=80")
Cocktail.create(name: "Mojito", image: "https://images.unsplash.com/photo-1536935338788-846bb9981813?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=986&q=80")
Cocktail.create(name: "Caïpirowska", image: "https://images.unsplash.com/photo-1551538827-9c037cb4f32a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=701&q=80")
Cocktail.create(name: "Sex on the beach", image: "https://images.unsplash.com/photo-1514362545857-3bc16c4c7d1b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80")
Cocktail.create(name: "Kir Royal", image: "https://images.unsplash.com/photo-1514361892635-6b07e31e75f9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80")
Cocktail.create(name: "Caïpirinha", image: "https://images.unsplash.com/photo-1504310578167-435ac09e69f3?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80")
Cocktail.create(name: "Moscow Mule", image: "https://images.unsplash.com/photo-1582837611539-e3020079eab6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=694&q=80")
Cocktail.create(name: "Jack and Coke", image: "https://images.unsplash.com/photo-1527661591475-527312dd65f5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=658&q=80")
Cocktail.create(name: "TGV", image: "https://images.unsplash.com/photo-1549746423-e5fe9cafded8?ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80")

Dose.create(description: "a little bit", cocktail_id: whiteRussian.id, ingredient_id: Ingredient.first.id)