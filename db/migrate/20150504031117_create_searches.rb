class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :sha
      t.string :recording_url

      t.timestamps null: false
    end

    add_index :searches, :sha
  end
end
