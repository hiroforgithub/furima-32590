FactoryBot.define do
  factory :item do
    title {"aaaa"}
    text {"aaa"}
    price {2222}
    category_id {2}
    prefecture_id {2}
    shipping_date_id {2}
    shipping_fee_id {2}
    status_id {2}

    after(:build) do |item|
      item.image.attach(io: File.open('public/apple-touch-icon.png'), filename: 'apple-touch-icon.png')
    end
    association :user
  end
end
