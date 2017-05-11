class Recipe < ActiveRecord::Base
  has_and_belongs_to_many(:ingredients)
  has_and_belongs_to_many(:categories)
  before_save(:title_name)
  validates(:name, :description, :presence => true)

private

  def title_name
    self.name=(name.split(/(\W)/).map(&:capitalize).join)
  end
end
