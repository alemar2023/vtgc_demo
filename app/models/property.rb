class Property < ApplicationRecord
  belongs_to :area
  has_many :item_values
  has_many :items, through: :item_values

  validates :name , presence: true, uniqueness: true
end