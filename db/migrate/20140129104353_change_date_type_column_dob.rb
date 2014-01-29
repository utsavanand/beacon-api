class ChangeDateTypeColumnDob < ActiveRecord::Migration
  def self.up
     change_table :users do |t|
       t.change :dob, :date
     end
   end
   def self.down
     change_table :users do |t|
       t.change :dob, :integer
     end
   end
end
