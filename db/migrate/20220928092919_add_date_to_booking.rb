class AddDateToBooking < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :from_date, :datetime, null: false
    add_column :bookings, :to_date, :datetime, null: false
  end
end
