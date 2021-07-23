class GroupForm
  include ActiveModel::Model
  include ActiveModel::Validations
  include ActiveModel::Attributes

  attr_accessor :group_name, :user_names, :current_user_id, :group_id

# Validation
  with_options presence: true do
    validates :group_name
    validates :user_names, if: :blank?
  end
  # 存在しないユーザーID && 空の保存ができない（配列版）
  validates :user_names, invite_user: { attr: 'group_id' }

# Method
  def save
    group = Group.create(name: group_name)
    GroupOwner.create(group_id: group.id, user_id: current_user_id)
    user = UserGroup.create(group_id: group.id, user_id: current_user_id)
    user_names.each do |user_name|
      user = User.find_by(user_name: user_name)
      GroupInvitation.create(user_id: user.id, group_id: group.id)
    end
  end

  def update
    group = Group.find(group_id)
    group.update(name: group_name)
    unless user_names.blank?
      user_names.each do |user_name|
        user = User.find_by(user_name: user_name)
        GroupInvitation.create(user_id: user.id, group_id: group.id)
      end
    end
  end

end