class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_food, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true
  validates :cooking_time, presence: true
  validates :preperation_time, presence: true
end
