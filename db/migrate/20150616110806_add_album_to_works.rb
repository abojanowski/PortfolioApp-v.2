class AddAlbumToWorks < ActiveRecord::Migration
  def change
    add_reference :works, :album, index: true, foreign_key: true
  end
end
