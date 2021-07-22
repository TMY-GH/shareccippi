class GroupInvitationsController < ApplicationController

  def create
    group_invitation = GroupInvitation.find_by(user_id: current_user.id, group_id: params[:id])
    group_invitation.destroy
    UserGroup.create(user_id: current_user.id, group_id: params[:id])
    redirect_to groups_path
  end

  def destroy
    group_invitation = GroupInvitation.find_by(user_id: current_user.id, group_id: params[:id])
    group_invitation.destroy
    redirect_to groups_path
  end

end
