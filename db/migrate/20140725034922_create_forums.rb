class CreateForums < ActiveRecord::Migration
  def change
    create_table :forums do |t|
      t.string :name
      t.text :description
      t.integer :user_id
      t.string :slug

      t.timestamps
    end
  end
end
