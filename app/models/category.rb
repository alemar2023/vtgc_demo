class Category < ApplicationRecord

  has_many :children, class_name: 'Category', foreign_key: 'parent_id'
  belongs_to :parent, class_name: 'Category', optional: true
  has_many :category_i18ns

  accepts_nested_attributes_for :category_i18ns

  has_one :eng_translation, -> { where(locale: "en")} , class_name: "CategoryI18n"

  has_many :items

end