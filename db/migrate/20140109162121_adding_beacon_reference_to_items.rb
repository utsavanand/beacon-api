class AddingBeaconReferenceToItems < ActiveRecord::Migration
  def change
    add_reference :items, :beacon, index: true
  end
end
