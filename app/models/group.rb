class Group < ApplicationRecord
  has_many :user_groups
  has_many :users, through: :user_groups
  has_many :user_group_posts, through: :user_groups
  
  accepts_nested_attributes_for :user_groups

  def admin
    user_groups.where(is_admin: true).first.try(:user)
  end

end
