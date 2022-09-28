class AddPictureToDemon < ActiveRecord::Migration[7.0]
  def change
    add_column :demons, :picture_url, :string
  end
end
