class GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_group, only: [:edit, :update, :destroy]
  
  def index
    user = User.find(current_user.id)
    @invited_groups = user.invited_groups
    @groups = user.groups.includes(:users)
  end
  
  def new
    @group_form = GroupForm.new
  end

  def create
    @group_form = GroupForm.new(group_form_params)
    if @group_form.valid?
      @group_form.save
      redirect_to groups_path
    else
      render :new
    end
  end

  def edit
    @group_form = GroupForm.new(group_name: @group.name)
  end

  def update
    @group_form = GroupForm.new(group_form_params_update)
    if @group_form.valid?
      @group_form.update
      redirect_to groups_path
    else
      render :edit
    end
  end

  def destroy
    @group.destroy
    redirect_to groups_path
  end

  private
  def group_form_params
    params.require(:group_form).permit(:group_name, user_names: []).merge(current_user_id: current_user.id)
  end
  def group_form_params_update
    params.require(:group_form).permit(:group_name, user_names: []).merge(current_user_id: current_user.id, group_id: params[:id])
  end

  def set_group
    @group = Group.find(params[:id])
  end
end