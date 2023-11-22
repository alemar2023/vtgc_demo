include LocalesHelper
class ItemI18n < ApplicationRecord

  enum locale: all_locales.index_by(&:itself), _prefix: :locale
  belongs_to :item

  validates :name , :locale , presence: true
  validates :locale, :uniqueness => {scope: :item}


end