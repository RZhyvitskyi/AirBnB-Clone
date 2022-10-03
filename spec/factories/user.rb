FactoryBot.define do
  factory :user do
    name { "MyString" }
    sequence(:email) { |n| "ererwe#{n}@gmail.com" }
    password { "654321" }
  end
end
