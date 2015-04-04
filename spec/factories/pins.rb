FactoryGirl.define do
  factory :pin do
    title "MyString"
    description "MyText"

    trait :without_title do
      title ''
    end
  end

end
