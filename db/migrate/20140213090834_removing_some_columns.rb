class RemovingSomeColumns < ActiveRecord::Migration
  def change
    remove_column :notes, :summary
  end
end
