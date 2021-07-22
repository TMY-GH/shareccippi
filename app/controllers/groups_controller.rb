class GroupsController < ApplicationController
  before_action :authenticate_user!
  def index
  end
  
  def new
    @group_form = GroupForm.new
  end

  def create
    @group_form = GroupForm.new(group_form_params)
    if @group_form.valid?
      binding.pry
      @group_form.save
      redirect_to groups_path
    else
      render :new
    end
  end

  private
  def group_form_params
    params.require(:group_form).permit(:group_name, user_names: [])
  end

end