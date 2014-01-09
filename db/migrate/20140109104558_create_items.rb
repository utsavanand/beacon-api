class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :image
      t.string :description
      t.integer :template
      t.string :category

      t.timestamps
    end
  end
end
