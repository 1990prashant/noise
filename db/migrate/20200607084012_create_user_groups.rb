class CreateUserGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :user_groups do |t|
      t.integer :user_id
      t.integer :group_id
      t.integer :invited_by_id
      t.boolean :accepted, default: false
      
      t.timestamps
    end
  end
end
