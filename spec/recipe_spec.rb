require("spec_helper")

describe(Recipe) do
  it "validates presence of name" do
    test_recipe = Recipe.create({:name=> "", :ingredients => "", :instructions => ""})
    expect(test_recipe.save()).to(eq(false))
  end

  it "validates length of ingredients" do
    test_recipe = Recipe.create({:name=> "Food", :ingredients => "a", :instructions => "Cook it"})
    expect(test_recipe.save()).to(eq(false))
  end

  describe('#tags') do
    it('tells which tags are under recipe') do
      test_recipe = Recipe.create({:name => "Soup", :ingredients => 'tiger bones', :instructions => 'in your mouth'})
      test_tag1 = Tag.create({:category => 'exotic'})
      test_tag2 = Tag.create({:category => 'meat'})
      test_recipe.tags.push([test_tag1, test_tag2])
      expect(test_recipe.tags()).to(eq([test_tag1, test_tag2]))
    end
  end

  it("converts the name to title case") do
    recipe = Recipe.create({:name => "chicken wangs", :ingredients => 'chicken wings', :instructions => 'eat'})
    expect(recipe.name()).to(eq("Chicken Wangs"))
  end
end
