class AddThumbnailImageToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :thumbnail_image, :string
  end
end
