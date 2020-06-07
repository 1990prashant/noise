class UsersController < ApplicationController
  
  before_action :load_user, only: :profile

  def profile
    @achievements = @user.achievements
    @groups = @user.groups
  end

  def share
    params[:group_ids].each do |group_id|
      user_group = current_user.user_groups.find_by_group_id(group_id.to_i)
      if user_group.present?
        user_group_post = user_group.user_group_posts.new(user_achievement_id: params[:ac_id].to_i, description: params[:description])
        user_group_post.save
      end
    end
    render json: { success: true }
  end

  private

    def load_user
      if params[:id].blank?
        @user = current_user
      else
        @user = User.find_by_id(params[:id])
      end
    end

end