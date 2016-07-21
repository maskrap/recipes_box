require("spec_helper")

describe(Recipe) do
  it { should have_and_belong_to_many(:tags) }
end
#   it "validates presence of name" do
#     test_recipe = Recipe.create({:name=> "", :ingredients => "", :instructions => ""})
#     expect(test_recipe.save()).to(eq(false))
#   end
#
#   it "validates length of ingredients" do
#     test_recipe = Recipe.create({:name=> "Food", :ingredients => "a", :instructions => "Cook it"})
#     expect(test_recipe.save()).to(eq(false))
#   end
#
#   it("converts the name to title case") do
#     recipe = Recipe.create({:name => "chicken wangs", :ingredients => 'chicken wings', :instructions => 'eat'})
#     expect(recipe.name()).to(eq("Chicken Wangs"))
#   end
# end
