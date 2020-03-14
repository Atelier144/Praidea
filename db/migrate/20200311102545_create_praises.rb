class CreatePraises < ActiveRecord::Migration[6.0]
  def change
    create_table :praises do |t|
      t.integer :user_id
      t.integer :post_id
      t.integer :stamp_id

      t.timestamps
    end
  end
end
