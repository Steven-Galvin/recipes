class Recipe < ActiveRecord::Base
  has_and_belongs_to_many(:ingredients)
  has_and_belongs_to_many(:categories)
  validates(:name, :presence => true, on: :update)
end
