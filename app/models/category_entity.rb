class CategoryEntity < ApplicationRecord
  validates :entity_id, presence: true
  validates :category_id, presence: true
  belongs_to :category
  belongs_to :entity
  validates :entity,
            uniqueness: { scope: :category, message: "You can't add the same transaction for the same category" }
end
