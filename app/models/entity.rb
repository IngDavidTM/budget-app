class Entity < ApplicationRecord
  validates :name, presence: true
  validates :amount, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  belongs_to :user
  has_many :category_entities, dependent: :destroy
  accepts_nested_attributes_for :category_entities
end
