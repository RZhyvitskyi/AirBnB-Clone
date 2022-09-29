class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :bookings, dependent: :destroy
  has_many :demons, dependent: :destroy
  has_many :reviews

  def my_demon_bookings
    Booking.where(demon_id: self.demons)
  end
end
