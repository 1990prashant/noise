class Milestone < ApplicationRecord
  has_many :user_achievements, as: :achievable
end
