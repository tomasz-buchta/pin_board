FactoryGirl.define do
  factory :user do
    email     {Faker::Internet.email}
    name      {Faker::Name.name}
    password  '12345678'

    factory :user_with_boards do

      transient do
        boards_count 3
      end
      after(:create) do |user,evaluator|
        create_list(:board,evaluator.boards_count,user: user)
      end
    end
  end

end
