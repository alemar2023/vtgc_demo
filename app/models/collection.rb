class Collection < ApplicationRecord
  belongs_to :brand
  has_many :items
  has_many :coll_i18ns

  validates :name, presence: true
  validates :name, :uniqueness => {scope: :brand}
  accepts_nested_attributes_for :coll_i18ns
  has_one :en_translation, -> { where(locale: "en")} , class_name: "CollI18n"



  has_one_attached :image
  has_many_attached :pictures
  has_rich_text :body

  def image_as_thumbnail
    image.variant(resize_to_limit:[300, 300]).processed
  end

  def image_as_thumbnail_small
    image.variant(resize_to_limit:[100, 100]).processed
  end

  def pictures_as_thumbanails
    pictures.map do |picture|
      picture.variant(resize_to_limit: [100, 100]).processed
    end
  end


end