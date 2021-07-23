class GroupsController < ApplicationController
  before_action :authenticate_user!
  
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

  def destroy
    group = Group.find(params[:id])
    group.destroy
    redirect_to groups_path
  end

  private
  def group_form_params
    params.require(:group_form).permit(:group_name, user_names: []).merge(current_user_id: current_user.id)
  end

end