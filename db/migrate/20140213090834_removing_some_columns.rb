class RemovingSomeColumns < ActiveRecord::Migration
  def change
    remove_column :notes, :summary
    remove_column :notes, :thumbnail_image
  end
end
