class RenameTypeColumnInNote < ActiveRecord::Migration
  def change
    rename_column :notes, :type, :noteType
  end
end
