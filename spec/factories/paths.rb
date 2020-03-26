FactoryBot.define do
  factory :path do
    base_url_id { 1 }
    unique_code { "MyString" }
    custom { false }
    stats { {} }
    clicks { 0 }
  end
end
