class AddItemReferenceToNote < ActiveRecord::Migration
  def change
    add_reference :notes, :item, index: true
  end
end
