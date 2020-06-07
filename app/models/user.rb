class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :achievements, class_name: 'UserAchievement'
  has_many :user_groups
  has_many :groups, through: :user_groups

  # scope :own_groups, -> { includes(user_groups: [:groups]).where('user_groups.is_admin = ?', true) }

  before_update :update_achievement

  private

    def update_achievement
      add_milestone(self.total_steps) if self.changes.include?(:total_steps)
      add_badge(self.level) if self.changes.include?(:level)
    end

    def add_milestone(steps)
      milestone = Milestone.where("required_steps <= ?", steps).last
      add_achievable(milestone) if milestone.present?
    end

    def add_badge(lvl)
      badge = Badge.find_by_required_level(lvl)
      add_achievable(badge) if badge.present?
    end

    def add_achievable(achievement)
      debugger
      user_achievement = achievement.user_achievements.find_or_initialize_by(user_id: self.id)
      user_achievement.save if user_achievement.new_record?
    end

end
