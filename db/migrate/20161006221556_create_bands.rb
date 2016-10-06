class CreateBands < ActiveRecord::Migration
  def change
    create_table :bands do |t|
      t.string :name, null: false

      t.index :name
      t.timestamps null: false
    end
  end
end
