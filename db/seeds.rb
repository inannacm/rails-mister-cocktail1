require "open-uri"


puts "Destroy ingredients" if Rails.env.development?
Ingredient.destroy_all

puts "Destroy Cocktails"
Cocktail.destroy_all if Rails.env.development?

# Ingredient.create(name: "lemon")
# Ingredient.create(name: "ice")
# Ingredient.create(name: "mint leaves")

puts "Create ingredients"
url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
ingredients = JSON.parse(open(url).read)
ingredients["drinks"].each do |ingredient|
  i = Ingredient.create(name: ingredient["strIngredient1"])
  puts "create #{i.name}"
end
