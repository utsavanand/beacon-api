class AddFbRelatedColumns < ActiveRecord::Migration
  def change
    add_column :users, :fb_token, :string
    add_column :users, :fb_id, :string
    add_column :users, :fb_token_expiry, :date
  end
end
