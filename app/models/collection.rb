class Collection < ApplicationRecord
  belongs_to :brand
  has_many :items

  validates :name, presence: true
  validates :name, :uniqueness => {scope: :brand}
end