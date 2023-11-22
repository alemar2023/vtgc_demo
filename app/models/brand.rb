class Brand < ApplicationRecord
  belongs_to :area
  has_many :items
  validates :name, presence: true, uniqueness: true
end