class UserAchievement < ApplicationRecord
  belongs_to :achievable, polymorphic: true
end
