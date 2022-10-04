class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :bookings, dependent: :destroy
  has_many :demons, dependent: :destroy
  has_many :reviews

  after_create :assign_default_role

  validate :must_have_a_role, on: :update

  def my_demon_bookings
    Booking.where(demon_id: self.demons)
  end

  private

  def must_have_a_role
    unless roles.any?
      errors.add(:roles, "Must have at least one role")
    end
  end

  def assign_default_role
    self.add_role(:newuser) if self.roles.blank?
  end
end
