class ChangeColumnTypeTokenExpiry < ActiveRecord::Migration
  def self.up
     change_table :users do |t|
       t.change :token_expiry, :datetime
     end
   end
   def self.down
     change_table :users do |t|
       t.change :token_expiry, :date
     end
   end
end
