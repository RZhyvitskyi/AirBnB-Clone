class Demon < ApplicationRecord
  scope :not_booked, ->(booked_demons) { where.not(id: booked_demons) }

  belongs_to :user
end
