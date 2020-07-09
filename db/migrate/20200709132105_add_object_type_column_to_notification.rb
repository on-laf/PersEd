class AddObjectTypeColumnToNotification < ActiveRecord::Migration[6.0]
  def change
    add_column :notifications, :object_type, :string
  end
end
