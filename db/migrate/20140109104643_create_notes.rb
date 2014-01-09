class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :title
      t.integer :type
      t.string :image
      t.string :description

      t.timestamps
    end
  end
end
