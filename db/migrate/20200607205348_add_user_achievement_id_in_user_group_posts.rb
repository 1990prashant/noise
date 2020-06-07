class AddUserAchievementIdInUserGroupPosts < ActiveRecord::Migration[6.0]
  def up
    add_column :user_group_posts, :user_achievement_id, :integer
  end

  def down
    remove_column :user_group_posts, :user_achievement_id
  end
end
