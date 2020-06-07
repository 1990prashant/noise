class UserGroupPost < ApplicationRecord
  include ActionView::Helpers::DateHelper
  belongs_to :user_group
  belongs_to :user_achievement, optional: true

  def posted_by
    user_group.try(:user).try(:name)
  end

  def posted_at
    time_ago_in_words(created_at) + ' ago'
  end

  def content
    user_achievement.try(:achievable).try(:name)
  end

end
