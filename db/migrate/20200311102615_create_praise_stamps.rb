class CreatePraiseStamps < ActiveRecord::Migration[6.0]
  def change
    create_table :praise_stamps do |t|
      t.string :image
      t.string :name

      t.timestamps
    end
  end
end
