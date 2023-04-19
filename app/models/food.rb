class Food < ApplicationRecord
  belongs_to :user
  has_many :recipe_food

  validates :name, presence: true, length: { maximum: 50 }
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :quantity, numericality: {integer_only: true, greater_than_or_equal_to: 0 }
end
