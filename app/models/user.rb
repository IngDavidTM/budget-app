class User < ApplicationRecord
  validates :name, presence: true
  has_many :entities, dependent: :destroy
  has_many :categories, dependent: :destroy
end
