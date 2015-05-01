class Board < ActiveRecord::Base

  has_many :pins

  validates_presence_of :title
end
