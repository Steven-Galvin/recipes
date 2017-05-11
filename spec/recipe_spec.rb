require "spec_helper"

describe(Recipe) do
  it { is_expected.to callback(:title_name).before(:save)}
  it 'capitalizes all words in the name' do
    recipe = Recipe.create({:name => 'this is a test', :description => "over it"})
    expect(recipe.name).to(eq('This Is A Test'))
  end
  it 'validates presence of name in update' do
    recipe = Recipe.create name: 'test', description: 'over it'
    expect(recipe.update(name: ' ', description: ' ')).to(eq(false))
  end

  describe("#categories") do
    it("lists the categories that a recipe resides in") do
      test_category = Category.create({:name => "Desserts"})
      test_recipe = Recipe.create({:name => "Chocolate Cake", :description => "A delicious dessert perfect for a party setting", :instruction => "lorem ipsum edus co lors", :rating => 4})
      test_recipe.categories.push(test_category)

      expect(test_recipe.categories).to(eq([test_category]))
    end
  end

  describe("#ingredients") do
    it("lists the ingredients that a recipe uses") do
      test_ingredient = Ingredient.create({:name => "chocolate"})
      test_recipe = Recipe.create({:name => "Chocolate Cake", :description => "A delicious dessert perfect for a party setting", :instruction => "lorem ipsum edus co lors", :rating => 4})
      test_recipe.ingredients.push(test_ingredient)

      expect(test_recipe.ingredients).to(eq([test_ingredient]))
    end
  end
end
