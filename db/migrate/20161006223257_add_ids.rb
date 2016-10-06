class AddIds < ActiveRecord::Migration
  def change
    add_column :albums, :band_id, :integer, null: false
    add_index :albums, :band_id

    add_column :tracks, :album_id, :integer, null: false
    add_index :tracks, :album_id
  end
end
