class ItemValue < ApplicationRecord

  belongs_to :property
  accepts_nested_attributes_for :property, reject_if: :all_blank #, allow_destroy: true

  belongs_to :item

  validates :value, presence: true

end