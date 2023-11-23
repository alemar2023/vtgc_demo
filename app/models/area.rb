class Area < ApplicationRecord

  has_many :items
  has_many :brands
  has_many :collections
  validates :name, presence: true, uniqueness: true
end