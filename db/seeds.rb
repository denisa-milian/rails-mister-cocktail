# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'

drinks = JSON.parse(open('https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list').read)
drinks = drinks['drinks']
drinks.each do |drink|
  Ingredient.create(name: drink['strIngredient1'])
end

Ingredient.create(name: "Lemon")
Ingredient.create(name: "Ice")
Ingredient.create(name: "Mint leaves")
