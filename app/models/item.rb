class Item < ApplicationRecord

  belongs_to :category

  belongs_to :collection, optional: true
  belongs_to :brand, optional: true
  has_many :item_values
  has_many :item_i18ns
  has_many :item_products

  # accepts_nested_attributes_for :blueprint_translations
  accepts_nested_attributes_for :item_i18ns, :item_values

  # has_many :properties, through: :blueprint_values
  has_one :en_translation, -> { where(locale: "en") }, class_name: "ItemI18n"

  validate :valid_brand?

  has_many :property, through: :item_values

  has_one :rarity, -> { joins(:property).where(properties: { name: 'rarity' }) }, class_name: 'ItemValue'



  has_one_attached :image
  has_many_attached :pictures
  has_rich_text :body

  def image_as_thumbnail
    image.variant(resize_to_limit:[150, 150]).processed
  end
  def pictures_as_thumbanails
    pictures.map do |picture|
      picture.variant(resize_to_limit: [100, 100]).processed
    end
  end


  def image_as_thumbnail_small
    image.variant(resize_to_limit:[100, 100]).processed
  end
  def valid_brand?

    # se collection presente anche il brand deve essere presente
    if self.collection_id.present? && self.brand_id.blank?
      errors.add(:brand_id, "se collection presente anche il brand deve essere presente")
    end

    # se esp e brand ok allora il brand del blueprint deve essere lo stesso brand dell'espansione alla quale     appartiene
    if self.collection_id.present? && self.brand_id.present? && self.brand_id != self.collection.brand_id
      errors.add(:brand_id, "se collection e brand ok allora il brand del item deve essere lo stesso brand della collection  alla quale appartiene")
    end

  end
end