require("spec_helper")

describe(Recipe) do
  describe('#tags') do
    it('tells which tags are under recipe') do
      test_recipe = Recipe.create({:ingredients => 'tiger bones', :instructions => 'in your mouth'})
      test_tag1 = Tag.create({:category => 'exotic'})
      test_tag2 = Tag.create({:category => 'meat'})
      test_recipe.tags.push([test_tag1, test_tag2])
      expect(test_recipe.tags()).to(eq([test_tag1, test_tag2]))
    end
  end
end
