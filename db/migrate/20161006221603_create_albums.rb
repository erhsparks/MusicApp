class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :title, null: false
      t.boolean :live, null: false, default: false

      t.index :title
      t.timestamps null: false
    end
  end
end
