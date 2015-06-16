class RemoveAlbumIdIdFromWorks < ActiveRecord::Migration
  def change
  	remove_column :works, :album_id_id, :integer
  end
end
