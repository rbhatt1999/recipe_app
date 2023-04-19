class Food < ApplicationRecord
  belongs_to :user
  has_many :recipe_food

  validates :name, presence: true, length: { maximum: 50 }
end
