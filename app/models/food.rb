class Food < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  has_many :recipe_foods

  validates :name, presence: true, uniqueness: true

  def count_for_recipe(recipe_id)
    recipe_foods.where(recipe_id:).count
  end

  def total_price
    food_prices = Food.pluck(:price)
    food_prices.sum
  end

  def total_food_items
    Food.count
  end
end
