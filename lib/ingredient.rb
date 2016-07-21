class Ingredient < ActiveRecord::Base
  has_and_belongs_to_many(:recipes)
  validates(:name, :presence => true)
  validates(:name, :length => { :minimum => 2 })
  before_save(:titleize_name)

private

  define_method(:titleize_name) do
    self.name=(name().titleize())
  end
end
