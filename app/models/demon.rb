class Demon < ApplicationRecord
  scope :not_booked, ->(booked_demons) { where.not(id: booked_demons) }
  scope :search_by_name, ->(name, not_booked_demons) { not_booked_demons.where("lower(name) LIKE ?", "%#{name.strip.downcase}%") }

  belongs_to :user
end
