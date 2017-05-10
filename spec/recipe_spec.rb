require "spec_helper"

describe(Recipe) do
  describe("#categories") do
    it("lists the categories that a recipe resides in") do
      test_category = Category.create({:name => "Desserts"})
      test_recipe = Recipe.create({:name => "Chocolate Cake", :description => "A delicious dessert perfect for a party setting", :instruction => "lorem ipsum edus co lors", :rating => 4})
      test_recipe.categories.push(test_category)

      expect(test_recipe.categories).to(eq([test_category]))
    end
  end

  describe("#categories") do
    it("lists the ingredients that a recipe uses") do
      test_ingredient = Ingredient.create({:name => "chocolate"})
      test_recipe = Recipe.create({:name => "Chocolate Cake", :description => "A delicious dessert perfect for a party setting", :instruction => "lorem ipsum edus co lors", :rating => 4})
      test_recipe.ingredients.push(test_ingredient)

      expect(test_recipe.ingredients).to(eq([test_ingredient]))
    end
  end
end
