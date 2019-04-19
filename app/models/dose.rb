class Dose < ApplicationRecord
  belongs_to :ingredient
  belongs_to :cocktail
  validates :description, presence: true
  validates :cocktail, :uniqueness => { scope: :ingredient_id }
  #accepts_nested_attributes_for :ingredient
end
