class AddingTheColumnsAgain < ActiveRecord::Migration
  def change
    add_column :notes, :thumbnail_image, :string
    add_column :notes, :summary, :string
  end
end
