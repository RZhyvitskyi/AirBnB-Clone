FactoryBot.define do
  factory :booking do
    approved { false }
    from_date { DateTime.now }
    to_date { DateTime.now }
    user
    demon
  end
end
