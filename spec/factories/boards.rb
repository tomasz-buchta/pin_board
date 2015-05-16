FactoryGirl.define do
  factory :board do
    title "MyString"
description "MyString"
    factory :board_with_pins do
      after(:create) do |board|
        5.times do
          create(:pin,board_id:board.id)
        end
      end
    end
  end
end
