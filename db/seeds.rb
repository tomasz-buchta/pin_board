require 'faker'

#seed boards

15.times do |n|
  a = Board.new
  a.title = Faker::Commerce.department(1)
  a.description = Faker::Lorem.sentence
  a.save
end

files = Dir.glob("db/seed_images/*.jpg")

boards = Board.all

boards.each do |board|
  30.times do |n|
    p = Pin.new
    p.title = Faker::Commerce.product_name
    p.board_id = board.id
    file_src = File.join Rails.root,files.sample
    p.image = File.new file_src
    p.description = Faker::Lorem.sentence
    p.save
  end
end