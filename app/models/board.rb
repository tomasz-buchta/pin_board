class Board < ActiveRecord::Base

  has_many :pins,dependent: :destroy

  validates_presence_of :title
end
