FactoryGirl.define do
  factory :board do
    title "MyString"
desription "MyString"
    factory :board_with_pins do
      transient do
        pins_count 5
      end

      after(:create) do |user,evaluator|
        create_list(:pin,evaluator.pins_count)
      end
    end
  end

end
