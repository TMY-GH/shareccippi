class GroupForm
  include ActiveModel::Model
  include ActiveModel::Validations
  include ActiveModel::Attributes

  attr_accessor :group_name, :user_names

# Validation
  with_options presence: true do
    validates :group_name
    validates :user_names
  end
  # 存在しないユーザーID && 空の保存ができない（配列版）
  validates :user_names, invite_user: true

# Method
  def save
    group = Group.create(name: group_name)
    user_names.each do |user_name|
      user = User.find_by(user_name: user_name)
      GroupInvitation.create(user_id: user.id, group_id: group.id)
    end
  end

end