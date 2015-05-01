FactoryGirl.define do
  factory :pin do
    title "MyString"
    description "MyText"
    image_file_name {'test.png'}
    image_content_type {'image/png'}
    image_file_size {1024}

    trait :without_title do
      title ''
    end
    trait :without_image do
      image_file_name nil
      image_content_type nil
      image_file_size nil
    end
  end

end
