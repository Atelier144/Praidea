class AddUsersRawImage < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :raw_image, :string
  end
end
