include LocalesHelper
class CollI18n < ApplicationRecord

  enum locale: all_locales.index_by(&:itself), _prefix: :locale
  belongs_to :collection

  validates :name , :locale , presence: true
  validates :locale, :uniqueness => {scope: :collection}
end
