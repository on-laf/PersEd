class CreateGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :groups do |t|
      t.string :class_name,

      t.timestamps
    end
  end
end
