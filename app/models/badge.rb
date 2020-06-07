class Badge < ApplicationRecord
  has_many :user_achievements, as: :achievable
end
