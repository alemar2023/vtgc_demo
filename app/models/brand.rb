class Brand < ApplicationRecord
  belongs_to :area
  has_many :items
  has_many :collections
  validates :name, presence: true, uniqueness: true
end