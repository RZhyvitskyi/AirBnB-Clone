class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.boolean :approved, default: false
      t.references :user, null: false, foreign_key: true
      t.references :demon, null: false, foreign_key: true

      t.timestamps
    end
  end
end
