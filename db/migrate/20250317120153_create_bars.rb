class CreateBars < ActiveRecord::Migration[7.1]
  def change
    create_table :bars do |t|
      t.string :name
      t.string :description
      t.string :address
      t.float :latitude
      t.float :longitude
      t.string :image_url
      t.string :phone
      t.string :website
      t.text :style
      t.references :created_by, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
