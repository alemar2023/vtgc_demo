class Collection < ApplicationRecord
  belongs_to :brand
  has_many :items

  validates :name, presence: true
  validates :name, :uniqueness => {scope: :brand}




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