require "spec_helper"

describe Recipe do
  it { should have_and_belong_to_many :tags }
  it "validates presence of name" do
    test_recipe = Recipe.create({:name=> "", :instructions => ""})
    expect(test_recipe.save()).to eq(false)
  end

  it "converts the name to title case" do
    recipe = Recipe.create({:name => "chicken wangs", :instructions => 'eat'})
    expect(recipe.name()).to eq("Chicken Wangs")
  end
end
