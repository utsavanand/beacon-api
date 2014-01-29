class AddTokenExpiryColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :token_expiry, :date
  end
end
