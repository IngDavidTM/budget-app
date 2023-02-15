class CategoryEntity < ApplicationRecord
  belongs_to :category
  belongs_to :entity
  validates :entity, uniqueness: { scope: :category, message: "You can't add the same transaction for the same category"}
end
