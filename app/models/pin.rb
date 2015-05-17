class Pin < ActiveRecord::Base

  belongs_to :board

  self.per_page = 15

  validates_presence_of :title
  has_attached_file :image,
                    :styles => {
                        medium: '400x400',
                        thumb: '100x100'}, :default_url => '/images/:style/missing.png'
  validates_attachment_presence :image
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
