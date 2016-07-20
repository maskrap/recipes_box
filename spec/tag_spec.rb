require("spec_helper")

describe(Tag) do
  describe('#recipes') do
    it('tells which recipes are in the tag') do
      test_tag = Tag.create({:category => 'exotic'})
      test_recipe = Recipe.create({:name => "Soup", :ingredients => 'tiger bones', :instructions => 'in your mouth'})
      test_tag.recipes.push([test_recipe])
      expect(test_tag.recipes()).to(eq([test_recipe]))
    end
  end
end
