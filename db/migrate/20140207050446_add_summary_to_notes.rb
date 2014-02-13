class AddSummaryToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :summary, :string
  end
end
