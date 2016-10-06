class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string  :name, null: false
      t.boolean :bonus, null: false, default: false
      t.text :lyrics

      t.index :name
      t.timestamps null: false
    end
  end
end
