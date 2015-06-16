class CreateWorks < ActiveRecord::Migration
  def change
    create_table :works do |t|
      t.string :picture
      t.references :album_id, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
