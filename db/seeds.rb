require 'faker'

#seed boards
p 'Seeding users'
3.times do
  FactoryGirl.create(:user)
end

p 'Seeding boards'
15.times do
  board = FactoryGirl.build(:board,user: User.all.sample)
  board.title = Faker::Commerce.product_name
  board.description = Faker::Lorem.sentence
  board.save
end

files = Dir.glob("db/seed_images/*.jpg")

boards = Board.all

p 'Seeding pins'

boards.each do |board|
  30.times do |n|
    p = Pin.new
    p.title = Faker::Commerce.product_name
    p.board_id = board.id
    file_src = File.join Rails.root,files.sample
    p.image = File.new file_src
    p.description = Faker::Lorem.sentence
    p.user = User.all.sample
    p.save
  end
end