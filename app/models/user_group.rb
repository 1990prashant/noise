class UserGroup < ApplicationRecord
  belongs_to :user
  belongs_to :group
  has_many :user_group_posts
end
