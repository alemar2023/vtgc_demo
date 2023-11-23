class CategoryI18n < ApplicationRecord

  belongs_to :category
  validates :name, presence: true
  validates :locale, presence: true

end