class CreateDemons < ActiveRecord::Migration[7.0]
  def change
    create_table :demons do |t|
      t.string :name
      t.string :speciality
      t.string :location

      t.timestamps
    end
  end
end
