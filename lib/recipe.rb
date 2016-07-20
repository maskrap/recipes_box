class Recipe < ActiveRecord::Base
  has_and_belongs_to_many(:tags)
  validates(:name, :presence => true)
  validates(:ingredients, :length => { :minimum => 2 })
  before_save(:titleize_name)

private

  define_method(:titleize_name) do
    self.name=(name().titleize())
  end
end
