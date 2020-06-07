class AddLevelIntoUsers < ActiveRecord::Migration[6.0]
  def up
    add_column :users, :level, :integer, default: 0
  end

  def down
    remove_column :users, :level
  end
end
