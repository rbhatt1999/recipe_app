class RecipeFood < ApplicationRecord
  belongs_to :recipe
  belongs_to :food

  validates :recipe_id, presence: true
  validates :food_id, presence: true
  validates :quantity, presence: true
  validates :quantity, numericality: { greater_than: 0 }
end
