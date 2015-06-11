require 'rails_helper'

RSpec.describe Board, :type => :model do
  it {should validate_presence_of(:title)}
  it {should have_many(:pins)}
  it {should validate_presence_of(:user)}
end
