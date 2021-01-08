FactoryBot.define do
  factory :buy_address do
    code {"123-4567"}
    prefecture_id {5}
    city {"横浜市"}
    street {"横浜"}
    building {"ビル"}
    tel {"12345678912"}
    token {"tok_abcdefghijk00000000000000000"}
    # user_id {2}
    # item_id {2}
  end
end
