class AddIsAdminInUserGroups < ActiveRecord::Migration[6.0]
  def up
    add_column :user_groups, :is_admin, :boolean, default: false
  end

  def down
    remove_column :user_groups, :is_admin
  end
end
