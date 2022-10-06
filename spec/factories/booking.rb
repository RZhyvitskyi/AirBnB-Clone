FactoryBot.define do
  factory :booking do
    approved { false }
    from_date { DateTime.now + 5.days }
    to_date { DateTime.now + 15.days }
    user
    demon
  end
end
