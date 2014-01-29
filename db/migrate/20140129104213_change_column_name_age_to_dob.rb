class ChangeColumnNameAgeToDob < ActiveRecord::Migration
  def change
    rename_column :users, :age, :dob
  end
end
