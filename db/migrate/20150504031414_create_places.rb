class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :response
      t.string :place_id
      t.string :phone_number
      t.boolean :complete, default: false
      t.integer :search_id
      t.string :sha

      t.timestamps null: false
    end

    add_index :places, :sha
  end
end
