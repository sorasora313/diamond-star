FactoryBot.define do
  factory :night do
    association :user

    after(:build) do |night|
      night.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png', content_type: 'image/png')
    end

    title {"海"}
    explain {"すごい"}
    genre_id {3}
    state_id {3}

  end
end
