require "spec_helper"

describe(Ingredient) do
  describe("#recipes") do
    it("lists the recipes that use a specific ingredient") do
      test_ingredient = Ingredient.create({:name => "chocolate"})
      test_recipe = Recipe.create({:name => "Chocolate Cake", :description => "A delicious dessert perfect for a party setting", :instruction => "lorem ipsum edus co lors", :rating => 4})
      test_ingredient.recipes.push(test_recipe)
      expect(test_ingredient.recipes).to(eq([test_recipe]))
    end
  end
end
