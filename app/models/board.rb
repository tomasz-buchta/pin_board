class Board < ActiveRecord::Base

  has_many :pins,dependent: :destroy

  validates_presence_of :title

  def image(size=nil)
    pins.sample.image.url(size)
  end
end
