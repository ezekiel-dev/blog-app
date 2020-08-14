class Article < ApplicationRecord
  has_many :comments
  has_many :taggings
  has_many :tags, through: :taggings
  has_attached_file :image, styles: { medium: '100vwX100vh>', thumb: '100X100' }
  validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/lpg', 'image/png']
end
