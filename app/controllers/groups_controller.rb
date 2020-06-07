class GroupsController < ApplicationController

  before_action :find_group, only: [:edit, :update, :destroy, :show]

  def index
    @groups = current_user.groups
  end

  def new
    @group = Group.new
    @users = User.all
  end

  def edit
    @users = User.all
  end

  def show
    @posts = @group.user_group_posts
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to groups_url, notice: "Group created successfully"
    else
      render action: :new
    end
  end

  def update
    if @group.update_attributes(group_params)
      redirect_to groups_url, notice: "Group updated successfully"
    else
      @users = User.all
      render action: :edit
    end
  end

  def destroy
    @group.destroy
    redirect_to groups_url, notice: "Group deleted successfully"
  end

  private

    def group_params
      params.require(:group).permit(:name, user_groups_attributes: [:is_admin, :id, :user_id, :group_id, :invited_by_id])
    end

    def find_group
      @group = Group.find_by_id(params[:id])
    end
end