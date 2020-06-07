class CreateUserGroupPosts < ActiveRecord::Migration[6.0]
  def change
    create_table :user_group_posts do |t|
      t.integer :user_group_id
      t.text :description
      t.integer :parent_id

      t.timestamps
    end
  end
end
