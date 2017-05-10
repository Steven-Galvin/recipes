require "spec_helper"

describe(Category) do
  describe("#recipes") do
    it("lists the recipes that fall under a specific category") do
      test_category = Category.create({:name => "Desserts"})
      test_recipe = Recipe.create({:name => "Chocolate Cake", :description => "A delicious dessert perfect for a party setting", :instruction => "lorem ipsum edus co lors", :rating => 4})
      test_category.recipes.push(test_recipe)
      expect(test_category.recipes).to(eq([test_recipe]))
    end
  end
end
