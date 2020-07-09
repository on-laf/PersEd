class RemoveMessageAddObjectColumnToNotification < ActiveRecord::Migration[6.0]
  def change
    remove_column :notifications, :message, :string
    add_column :notifications, :object_id, :integer
  end
end
