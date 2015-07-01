class Board < ActiveRecord::Base

  has_many :pins,dependent: :destroy
  belongs_to :user

  validates_presence_of :title
  validates_presence_of :user
  self.per_page = 15

  def image(size=nil)
    unless pins.empty?
      pins.sample.image.url(size)
    end
  end
end
