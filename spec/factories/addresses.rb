FactoryBot.define do
  factory :address do
    code {"123-4567"}
    prefecture_id {5}
    city {"横浜市"}
    street {"横浜"}
    building {"ビル"}
    tel {"0900000000"}
  end
end
