class AddOwnerToDemon < ActiveRecord::Migration[7.0]
  def change
    add_reference :demons, :user, null: false, foreign_key: true
  end
end
