class Brand < ApplicationRecord
  belongs_to :area
  has_many :items
  has_many :collections
  validates :name, presence: true, uniqueness: true



  has_one_attached :image
  has_many_attached :pictures
  has_rich_text :body

  has_one :enbra_translation, -> { where(locale: "en")} , class_name: "BrandI18n"

  def image_as_thumbnail
    image.variant(resize_to_limit:[150, 150]).processed
  end
  def pictures_as_thumbanails
    pictures.map do |picture|
      picture.variant(resize_to_limit: [100, 100]).processed
    end
  end
end